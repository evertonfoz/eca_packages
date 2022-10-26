import 'dart:io';

import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';

class CropImagePageECA extends StatefulWidget {
  final String title;
  final String originalFilePath;
  final Color titleColor;
  final Color iconProgressBarColor;
  final Color progressBarContainerColor;
  final Color valueProgressBarContainerColor;

  const CropImagePageECA({
    Key? key,
    required this.title,
    required this.originalFilePath,
    required this.titleColor,
    required this.iconProgressBarColor,
    required this.progressBarContainerColor,
    required this.valueProgressBarContainerColor,
  }) : super(key: key);

  @override
  State<CropImagePageECA> createState() => _CropImagePageECAState();
}

class _CropImagePageECAState extends State<CropImagePageECA> {
  final GlobalKey<CropState> _imageCropKey = GlobalKey<CropState>();
  // double _aspectRation = 1;
  late double aspectImageSizeToScreeSize;
  late File fileOriginalImage;
  late double progressBarWidthToAspectRadio;
  late int widthFactorToProgressBarWidthToAspectRadio = 0;
  late Size originalImageSize;

  @override
  void initState() {
    super.initState();
    fileOriginalImage = File(widget.originalFilePath);
    originalImageSize = ImageSizeGetter.getSize(
      FileInput(fileOriginalImage),
    );
    if (originalImageSize.width > originalImageSize.height) {
      aspectImageSizeToScreeSize = 0.35;
    } else if (originalImageSize.width == originalImageSize.height) {
      aspectImageSizeToScreeSize = 0.75;
    } else {
      aspectImageSizeToScreeSize =
          originalImageSize.width / originalImageSize.height;
    }
  }

  @override
  Widget build(BuildContext context) {
    progressBarWidthToAspectRadio = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextECA(
                  text: widget.title,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: widget.titleColor,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Card(
                  color: Colors.black,
                  // margin: EdgeInsets.all(8),
                  surfaceTintColor: Colors.amber,
                  elevation: 2,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height:
                        (originalImageSize.height == originalImageSize.width)
                            ? MediaQuery.of(context).size.width
                            : MediaQuery.of(context).size.height *
                                aspectImageSizeToScreeSize,
                    child: Crop(
                      alwaysShowGrid: true,
                      key: _imageCropKey,
                      image: Image.file(
                        fileOriginalImage,
                        fit: BoxFit.fitHeight,
                      ).image,
                      aspectRatio: _buildAspectRadio(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: 30),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
                child: Visibility(
                  visible: widthFactorToProgressBarWidthToAspectRadio > 0,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widthFactorToProgressBarWidthToAspectRadio--;
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      size: 30,
                      color: widget.iconProgressBarColor,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 32,
                width: progressBarWidthToAspectRadio,
                decoration: BoxDecoration(
                  color: widget.progressBarContainerColor,
                  border: Border.all(
                      color: widget.valueProgressBarContainerColor, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FractionallySizedBox(
                  widthFactor: widthFactorToProgressBarWidthToAspectRadio / 10,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.valueProgressBarContainerColor,
                      // border: Border.all(
                      //     color: kBrandMaterialColor.shade100, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextECA(
                        text:
                            '${(widthFactorToProgressBarWidthToAspectRadio * 10).toInt()}',
                        color: Colors.white),
                  ),
                ),
              ),
              Visibility(
                visible: widthFactorToProgressBarWidthToAspectRadio < 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widthFactorToProgressBarWidthToAspectRadio++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: widget.iconProgressBarColor,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 5,
              ),
              FloatingActionButton(
                tooltip: 'Aceitar a imagem dentro da grade',
                backgroundColor: Colors.black38,
                heroTag: 'crop',
                onPressed: () async {
                  final crop = _imageCropKey.currentState;
                  // final scale = crop?.scale;
                  final area = crop?.area;
                  await ImageCrop.requestPermissions();

                  final sampledFile = await ImageCrop.sampleImage(
                    file: File(widget.originalFilePath),
                    preferredWidth: (1024 / crop!.scale).round(),
                    preferredHeight: (4096 / crop.scale).round(),
                  );

                  final croppedFile = await ImageCrop.cropImage(
                    file: sampledFile,
                    area: crop.area!,
                  );

                  Modular.to.pop(croppedFile.path);
                },
                child: Icon(
                  Icons.crop,
                  color: widget.progressBarContainerColor,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FloatingActionButton(
                tooltip: 'Ficar com a imagem original, sem a grade',
                backgroundColor: Colors.black38,
                heroTag: 'original',
                onPressed: () async {
                  Modular.to.pop(widget.originalFilePath);
                  // Navigator.of(context).pop(widget.originalFilePath);
                },
                child: Icon(
                  Icons.crop_original,
                  color: widget.progressBarContainerColor,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FloatingActionButton(
                tooltip: 'Voltar para escolher outra imagem',
                backgroundColor: Colors.black38,
                heroTag: 'exit',
                onPressed: () async {
                  Modular.to.pop();
                },
                child: Icon(
                  Icons.exit_to_app,
                  color: widget.progressBarContainerColor,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildAspectRadio() {
    if (originalImageSize.height > originalImageSize.width) {
      return ((2 - widthFactorToProgressBarWidthToAspectRadio / 10) - 0.4);
    } else if (originalImageSize.height == originalImageSize.width) {
      return ((2 - widthFactorToProgressBarWidthToAspectRadio / 10));
    }
    return ((2 - widthFactorToProgressBarWidthToAspectRadio / 10) + 0.3);
  }
}
