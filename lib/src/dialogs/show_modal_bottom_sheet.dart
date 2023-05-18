import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

showModalBottomSheetToPickAPhoto({
  required final BuildContext context,
  String title = 'Selecione uma opção',
  String? subtitle,
  Color? titleColor,
  Color? cameraIconColor,
  Color? galleryIconColor,
  String cameraButtonText = 'Tirar uma foto',
  String galleryButtonText = 'Escolher da galeria',
  Color? backgroundButtonColor,
  Color? textButtonColor,
  String backButtonText = 'Voltar',
  Color? primaryColor,
  int? imageQuality,
  double fontSizeButtonSource = 20,
  IconData firstButtonIcon = Icons.camera_alt_outlined,
  IconData secondButtonIcon = Icons.landscape_outlined,
  required final Function(String?) onPickedNewAvatar,
  bool pickAVideo = false,
  Color? backgroundButtonCameraColor,
  Color? backgroundButtonGalleryColor,
  // GlobalKey<CropState>? imageCropKey,
}) async {
  FocusScope.of(context).unfocus();
  await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: primaryColor ?? Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              TextECA(
                text: title,
                fontSize: 30,
                color:
                    titleColor ?? Theme.of(context).textTheme.headline1?.color,
                fontWeight: FontWeight.bold,
              ),
              Visibility(
                visible: subtitle != null,
                child: TextECA(
                  text: subtitle ?? '',
                  fontSize: 20,
                  color: titleColor ??
                      Theme.of(context).textTheme.headline1?.color,
                ),
              ),
              ImagePickerECA(
                // maxWidthOfImage: MediaQuery.of(context).size.width,
                // maxHeightOfImage: MediaQuery.of(context).size.height * 0.5,
                // imageCropKey: imageCropKey,
                pickAVideo: pickAVideo,
                imageQuality: imageQuality,
                doPopAfterPicker: true,
                showFabButtonsInColumn: true,
                showImageAfterPick: false,
                galleryFloatActionButtonColor: galleryIconColor,
                cameraFloatActionButtonColor: cameraIconColor,
                heightImageContainer: MediaQuery.of(context).size.height * 0.35,
                onPickedNewAvatar: (value) {
                  onPickedNewAvatar(value);
                },
                cameraPicker: RoundedContainerECA(
                  height: 50,
                  borderColor: Colors.transparent,
                  backgroundColor:
                      backgroundButtonCameraColor ?? Colors.grey.shade100,
                  child: Row(children: [
                    Icon(firstButtonIcon, size: 30),
                    const SizedBox(width: 10),
                    TextECA(
                      text: cameraButtonText,
                      fontSize: fontSizeButtonSource,
                    ),
                  ]),
                ),
                galleryPicker: RoundedContainerECA(
                  height: 50,
                  borderColor: Colors.transparent,
                  backgroundColor:
                      backgroundButtonGalleryColor ?? Colors.grey.shade100,
                  child: Row(children: [
                    Icon(secondButtonIcon, size: 30),
                    const SizedBox(width: 10),
                    TextECA(
                      text: galleryButtonText,
                      fontSize: fontSizeButtonSource,
                    ),
                  ]),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 56),
                    child: DefaultRoundedBorderButton(
                      radius: 10,
                      backgroundColor: backgroundButtonColor,
                      fontColor: textButtonColor,
                      text: backButtonText,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

showModalBottomSheetToSimpleInformation({
  required final BuildContext context,
  String title = 'Informação',
  String? information,
  Color? titleColor,
  Color? backgroundButtonColor,
  Color? textButtonColor,
  String backButtonText = 'OK',
  Color? primaryColor,
  double? maxWidth,
  Widget? imageBetweenTitleAndInformation,
  bool? doublePopOnBackButtonPressed,
}) async {
  await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? MediaQuery.of(context).size.width,
      ),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: primaryColor ?? Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(maxWidth != null ? 10 : 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                TextECA(
                  text: title,
                  fontSize: 50,
                  color: titleColor ??
                      Theme.of(context).textTheme.headline1?.color,
                  fontWeight: FontWeight.bold,
                ),
                if (imageBetweenTitleAndInformation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: imageBetweenTitleAndInformation,
                  ),
                if (information != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextECA(
                      text: information,
                      fontSize: 20,
                      color: titleColor ??
                          Theme.of(context).textTheme.headline1?.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 28.0, left: 8, right: 8),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 56),
                      child: DefaultRoundedBorderButton(
                        radius: 10,
                        backgroundColor: backgroundButtonColor,
                        fontColor: textButtonColor ??
                            Theme.of(context).textTheme.headline2?.color,
                        text: backButtonText,
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (doublePopOnBackButtonPressed != null &&
                              doublePopOnBackButtonPressed) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
