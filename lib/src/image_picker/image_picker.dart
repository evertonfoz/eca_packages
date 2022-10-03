import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../eca_packages.dart';

const double kMaxWidthOfImage = 600;
const double kMaxHeightOfImage = 1024;
const int kImageQuality = 80;

class ImagePickerECA extends StatefulWidget {
  final bool showFabButtonsInColumn;
  final VoidCallback? onCancelPress;
  final VoidCallback? onConfirmPress;
  final Function(String?)? onPickedNewAvatar;
  final Color? divideColor;
  final Color? galleryFloatActionButtonColor;
  final Color? cameraFloatActionButtonColor;
  final Color? galleryIconColor;
  final Color? cameraIconColor;
  final MaterialColor? indicatorProcessingColor;
  final double maxWidthOfImage;
  final double maxHeightOfImage;
  final double heightImageContainer;
  final int? imageQuality;
  final bool showImageAfterPick;
  final Widget? galleryPicker;
  final Widget? cameraPicker;
  final bool doPopAfterPicker;
  final bool pickAVideo;
  final Color? cropTitleColor;
  final bool isToCircleAvatar;
  // final GlobalKey<CropState>? imageCropKey;

  const ImagePickerECA({
    Key? key,
    this.onCancelPress,
    this.onPickedNewAvatar,
    this.onConfirmPress,
    this.divideColor,
    this.galleryFloatActionButtonColor,
    this.cameraFloatActionButtonColor,
    this.galleryIconColor,
    this.cameraIconColor,
    this.indicatorProcessingColor,
    this.showFabButtonsInColumn = true,
    this.maxWidthOfImage = kMaxWidthOfImage,
    this.maxHeightOfImage = kMaxHeightOfImage,
    this.imageQuality = kImageQuality,
    this.heightImageContainer = 200,
    this.showImageAfterPick = true,
    this.galleryPicker,
    this.cameraPicker,
    this.doPopAfterPicker = false,
    this.pickAVideo = false,
    this.cropTitleColor,
    this.isToCircleAvatar = false,
    // this.imageCropKey,
  }) : super(key: key);

  @override
  State<ImagePickerECA> createState() => _ImagePikerECAState();
}

class _ImagePikerECAState extends State<ImagePickerECA> {
  final ImagePicker _picker = ImagePicker();
  final ImagePickerStore _imagePickerStore = ImagePickerStore();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;
  String? _retrieveDataError;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  get _imagePathFile => _imageFileList != null ? _imageFileList![0].path : null;

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _fabButtons() {
    return [
      widget.cameraPicker != null
          ? InkWell(
              child: widget.cameraPicker!,
              onTap: () => _onImageButtonPressed(ImageSource.camera),
            )
          : FloatingActionButton(
              heroTag: 'Camera',
              backgroundColor: widget.cameraFloatActionButtonColor ??
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
              child: Icon(
                Icons.add_a_photo_outlined,
                color: widget.galleryIconColor ??
                    Theme.of(context).floatingActionButtonTheme.foregroundColor,
                size: 30,
              ),
              onPressed: () {
                _onImageButtonPressed(ImageSource.camera);
              }),
      widget.showFabButtonsInColumn
          ? const SizedBox(height: 10)
          : const SizedBox(width: 10),
      const SizedBox(width: 20),
      widget.galleryPicker != null
          ? InkWell(
              child: widget.galleryPicker!,
              onTap: () => _onImageButtonPressed(ImageSource.gallery),
            )
          : FloatingActionButton(
              heroTag: 'Galeria',
              backgroundColor: widget.galleryFloatActionButtonColor ??
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
              child: Icon(
                Icons.collections_outlined,
                color: widget.galleryIconColor ??
                    Theme.of(context).floatingActionButtonTheme.foregroundColor,
                size: 30,
              ),
              onPressed: () {
                _onImageButtonPressed(ImageSource.gallery);
              }),
    ];
  }

  _build() {
    if (widget.showFabButtonsInColumn) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8, top: 10),
            child: Divider(
                color: widget.divideColor ?? Theme.of(context).dividerColor,
                height: 5),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _fabButtons(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8, top: 10),
            child: Divider(
                color: widget.divideColor ?? Theme.of(context).dividerColor,
                height: 5),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8, top: 10),
            child: Center(
              child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                  ? FutureBuilder<void>(
                      future: _retrieveLostData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: IndicatorProcessingCircularTextAndGif(
                                loadingColor: widget.indicatorProcessingColor ??
                                    Colors.indigo,
                                texts: const [
                                  'aguarde',
                                  'recuperando',
                                  'images'
                                ],
                              ),
                            );
                          case ConnectionState.done:
                            return _handlePreview();
                          default:
                            if (snapshot.hasError) {
                              return TextECA(
                                text:
                                    'Erro ao recuperar a imagem: ${snapshot.error}}',
                                textAlign: TextAlign.center,
                              );
                            } else {
                              return TextECA(
                                text: widget.cameraPicker == null
                                    ? 'Você ainda não selecionou nenhuma imagem.'
                                    : '',
                                textAlign: TextAlign.center,
                              );
                            }
                        }
                      },
                    )
                  : _handlePreview(),
            ),
          ),
        ],
      );
    }

    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Column(children: _fabButtons()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  void _onImageButtonPressed(ImageSource source) async {
    try {
      final XFile? pickedFile;
      if (!widget.pickAVideo) {
        pickedFile = await _picker.pickImage(
          source: source,
          maxWidth: widget.maxHeightOfImage,
          maxHeight: widget.maxHeightOfImage,
          imageQuality: widget.imageQuality,
        );
      } else {
        pickedFile = await _picker.pickVideo(
          source: source,
          maxDuration: const Duration(seconds: 30),
        );
      }
      setState(() {
        _imageFile = pickedFile;
      });

      widget.onPickedNewAvatar!(pickedFile!.path);
      if (widget.doPopAfterPicker) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null && widget.showImageAfterPick) {
      _imagePickerStore.registerNewAvatarPath(_imagePathFile);
      return SizedBox(
        height: widget.heightImageContainer,
        child: kIsWeb
            ? Image.network(
                _imagePathFile,
              )
            : Image.file(
                File(_imagePathFile),
              ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Erro na captura da imagem: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        widget.cameraPicker == null
            ? 'Você ainda não selecionou uma imagem'
            : '',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    return _previewImages();
  }
}
