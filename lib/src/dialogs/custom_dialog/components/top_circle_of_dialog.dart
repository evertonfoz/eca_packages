// ignore_for_file: curly_braces_in_flow_control_structures, use_key_in_widget_constructors
import 'package:eca_packages/src/dialogs/custom_dialog/custom_dialog_information.dart';
import 'package:flutter/material.dart';

class TopCircleOfDialogWidget extends StatelessWidget {
  final CustomDialogTypes customDialogType;
  final Widget? widgetToTopCircle;
  final Color? avatarColor;

  const TopCircleOfDialogWidget(
      {required this.customDialogType,
      required this.widgetToTopCircle,
      this.avatarColor});

  @override
  Widget build(BuildContext context) {
    Color avatarColor = this.avatarColor ?? _defineBackGroundAvatarColor();

    return Positioned(
      left: Consts.padding,
      right: Consts.padding,
      child: CircleAvatar(
        backgroundColor: avatarColor,
        radius: Consts.avatarRadius,
        child: widgetToTopCircle,
      ),
    );
  }

  _defineBackGroundAvatarColor() {
    if (customDialogType == CustomDialogTypes.Success)
      return Colors.green[900];
    else if (customDialogType == CustomDialogTypes.Fail)
      return Colors.orange.shade800;
    else if (customDialogType == CustomDialogTypes.Warning)
      return Colors.yellow[500];
    else if (customDialogType == CustomDialogTypes.Question)
      return Colors.teal[500];

    return Colors.blueAccent;
  }
}
