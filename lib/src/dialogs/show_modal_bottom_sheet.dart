import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

showModalBottomSheetToPickAPhoto({
  required BuildContext context,
  required String title,
  required Color titleColor,
  required Color cameraIconColor,
  required Color galleryIconColor,
  required String cameraButtonText,
  required String galleryButtonText,
  required Color? backgroundButtonColor,
  required Color textButtonColor,
  required String backButtonText,
}) async {
  await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              TextECA(
                text: title,
                fontSize: 30,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
              ImagePickerECA(
                doPopAfterPicker: true,
                showFabButtonsInColumn: true,
                showImageAfterPick: false,
                galleryFloatActionButtonColor: galleryIconColor,
                cameraFloatActionButtonColor: cameraIconColor,
                heightImageContainer: MediaQuery.of(context).size.height * 0.35,
                onPickedNewAvatar: (value) {
                  // registerStore
                  //     .registerAvatar(value);
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
