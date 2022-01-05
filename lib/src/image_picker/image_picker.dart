import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../eca_packages.dart';

const double kMaxWidth = 600;
const double kMaxHeight = 1024;
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
  final double maxWidth;
  final double maxHeight;
  final int imageQuality;

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
    this.maxWidth = kMaxWidth,
    this.maxHeight = kMaxHeight,
    this.imageQuality = kImageQuality,
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

  @override
  void dispose() {
    super.dispose();
  }

  _fabButtons() {
    return [
      FloatingActionButton(
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
      const SizedBox(width: 10),
      FloatingActionButton(
          heroTag: 'Camera',
          backgroundColor: widget.galleryFloatActionButtonColor ??
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
            child: Row(
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
                                  'posts'
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
                                text:
                                    'Você ainda não selecionou nenhuma imagem.',
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
      final pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: widget.maxHeight,
        maxHeight: widget.maxHeight,
        imageQuality: widget.imageQuality,
      );
      setState(() {
        _imageFile = pickedFile;
      });
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
    if (_imageFileList != null) {
      final String imagePath = _imageFileList![0].path;

      _imagePickerStore.registerNewAvatarPath(imagePath);
      return Container(
        child: kIsWeb
            ? Image.network(imagePath)
            : Image.file(
                File(imagePath),
              ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Erro na captura da imagem: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'Você ainda não selecionou uma imagem',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    return _previewImages();
  }
}
