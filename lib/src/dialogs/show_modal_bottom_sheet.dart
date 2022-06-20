import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

showModalBottomSheetToPickAPhoto({
  required final BuildContext context,
  String title = 'Selecione uma opção',
  Color? titleColor,
  Color? cameraIconColor,
  Color? galleryIconColor,
  String cameraButtonText = 'Tirar uma foto',
  String galleryButtonText = 'Escolher da galeira',
  Color? backgroundButtonColor,
  Color? textButtonColor,
  String backButtonText = 'Voltar',
  Color? primaryColor,
  required final Function(String?) onPickedNewAvatar,
}) async {
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
              ImagePickerECA(
                imageQuality: 40,
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
                  backgroundColor: Colors.grey.shade100,
                  child: Row(children: [
                    const Icon(Icons.camera_alt_outlined, size: 30),
                    const SizedBox(width: 10),
                    TextECA(text: cameraButtonText),
                  ]),
                ),
                galleryPicker: RoundedContainerECA(
                  height: 50,
                  borderColor: Colors.transparent,
                  backgroundColor: Colors.grey.shade100,
                  child: Row(children: [
                    const Icon(Icons.landscape_outlined, size: 30),
                    const SizedBox(width: 10),
                    TextECA(text: galleryButtonText),
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
  required String information,
  Color? titleColor,
  Color? backgroundButtonColor,
  Color? textButtonColor,
  String backButtonText = 'OK',
  Color? primaryColor,
  double? maxWidth,
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
                  fontSize: 30,
                  color: titleColor ??
                      Theme.of(context).textTheme.headline1?.color,
                  fontWeight: FontWeight.bold,
                ),
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
