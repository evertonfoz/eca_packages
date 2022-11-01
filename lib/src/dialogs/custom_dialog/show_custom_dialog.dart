import 'package:flutter/material.dart';

import 'custom_dialog_information.dart';

showCustomDialog({
  required String title,
  required BuildContext context,
  String? description,
  Widget? widgetToTopCircle,
  String? urlToInnerImage,
  String? errorToCopy,
  CustomDialogTypes? customDialogType,
  String? leftButtonText,
  String? rigthButtonText,
  String? centerButtonText,
  VoidCallback? onLeftButtonPressed,
  Function? onRightButtonPressed,
  VoidCallback? onCenterButtonPressed,
  Color? leftButtonColor,
  Color? rightButtonColor,
  Color? avatarColor,
}) async {
  assert(((leftButtonText != null && onLeftButtonPressed != null) ||
          (leftButtonText == null && onLeftButtonPressed == null)) ||
      (leftButtonText == null && rigthButtonText == null) &&
          centerButtonText != null);
  // print(errorToCopy);
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => CustomDialogInformation(
      title: title,
      description: description,
      widgetToTopCircle: widgetToTopCircle,
      customDialogType: customDialogType ?? CustomDialogTypes.Success,
      leftButtonText: leftButtonText,
      rigthButtonText: rigthButtonText,
      onLeftButtonPressed: onLeftButtonPressed,
      errorToCopy: errorToCopy,
      leftButtonColor: leftButtonColor,
      rightButtonColor: rightButtonColor,
      centerButtonText: centerButtonText,
      onRigthButtonPressed: onRightButtonPressed,
      urlToInnerImage: urlToInnerImage,
      onCenterButtonPressed: onCenterButtonPressed,
      avatarColor: avatarColor,
    ),
  );
}
