// ignore_for_file: curly_braces_in_flow_control_structures, unused_element, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:eca_packages/eca_packages.dart';

import 'package:flutter/material.dart';

class CustomDialogButtonsWidget extends StatelessWidget {
  final VoidCallback? onLeftButtonPressed;
  final Function? onRigthButtonPressed;
  final VoidCallback? onCenterButtonPressed;
  final CustomDialogTypes customDialogType;
  final Color? rigthButtonColor;
  final Color? leftButtonColor;
  final String? leftButtonText;
  final String? rigthButtonText;
  final String? centerButtonText;

  CustomDialogButtonsWidget({
    this.onLeftButtonPressed,
    required this.customDialogType,
    this.leftButtonColor,
    this.rigthButtonColor,
    this.leftButtonText,
    this.onRigthButtonPressed,
    this.rigthButtonText,
    this.centerButtonText,
    this.onCenterButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: centerButtonText != null
          ? MainAxisAlignment.center
          : MainAxisAlignment.end,
      children: [
        _leftButton(context),
        SizedBox(width: 10),
        _centerButton(context),
        SizedBox(width: 10),
        _rightButton(context),
      ],
    );
  }

  _leftButton(BuildContext context) {
    return Visibility(
      visible: leftButtonText != null,
      child: Column(
        children: [
          DefaultTextButton(
            backgroundColor: leftButtonColor ?? _leftButtonColor(),
            foregroundColor: Colors.white,
            text: leftButtonText ?? '',
            onPressed: () {
              if (onLeftButtonPressed == null) {
                Navigator.of(context).pop();
              } else {
                onLeftButtonPressed!();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  _centerButton(BuildContext context) {
    return Visibility(
      visible: centerButtonText != null,
      child: DefaultTextButton(
        backgroundColor: leftButtonColor ?? _leftButtonColor(),
        foregroundColor: Colors.white,
        text: centerButtonText ?? '',
        onPressed: () {
          if (onCenterButtonPressed == null)
            Navigator.of(context).pop();
          else {
            onCenterButtonPressed!();
            Navigator.of(context).pop();
          }
        },
      ),

      // Center(
      //   child: Padding(
      //     padding: const EdgeInsets.only(bottom: 28.0),
      //     child: ConstrainedBox(
      //       constraints: BoxConstraints.tightFor(
      //           width: MediaQuery.of(context).size.width * 0.6, height: 48),
      //       child: ElevatedButton(
      //         child: Text(c),
      //         onPressed: () {
      //           if (onCenterButtonPressed == null)
      //             Navigator.of(context).pop();
      //           else {
      //             Navigator.of(context).pop();
      //             onCenterButtonPressed!();
      //           }
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  _rightButton(BuildContext context) {
    return Visibility(
      visible: rigthButtonText != null,
      child: DefaultTextButton(
        foregroundColor: Colors.white,
        backgroundColor: rigthButtonColor ?? _rightButtonColor(),
        // textColor: this.leftButtonColor ?? _rightButtonColor(),
        text: rigthButtonText ?? 'OK',
        onPressed: () {
          if (onRigthButtonPressed == null)
            Navigator.of(context).pop();
          else {
            onRigthButtonPressed!();
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  _rightButtonColor() {
    if (customDialogType == CustomDialogTypes.Success)
      return Colors.green[400];
    else if (customDialogType == CustomDialogTypes.Fail)
      return Colors.red[900];
    else if (customDialogType == CustomDialogTypes.Warning)
      return Colors.yellow[400];
    else if (customDialogType == CustomDialogTypes.Question)
      return Colors.teal[500];
  }

  _leftButtonColor() {
    if (customDialogType == CustomDialogTypes.Success)
      return Colors.green[300];
    else if (customDialogType == CustomDialogTypes.Fail)
      return Colors.red[400];
    else if (customDialogType == CustomDialogTypes.Question)
      return Colors.teal[300];
  }
}
