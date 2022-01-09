import 'package:eca_packages/eca_packages.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void showBottomSnackBar({
  bool persistent = true,
  EdgeInsets margin = EdgeInsets.zero,
  required BuildContext context,
  int durationSeconds = 2,
  String? title,
  String? content,
  Color? borderColor,
  Color? backgroundColor,
  Color? textColor,
  TextAlign? textAlign,
}) {
  assert(
      (title != null || content != null) &&
          (borderColor != null ||
              Theme.of(context).snackBarTheme.shape.runtimeType ==
                  RoundedRectangleBorder),
      'É preciso informar o título ou conteúdo. informar o borderColor ou ter o shape de SnackBarTheme como RoundedRectangleBorder');
  final RoundedRectangleBorder _borderShape =
      Theme.of(context).snackBarTheme.shape as RoundedRectangleBorder;
  showFlash(
    context: context,
    duration: Duration(seconds: durationSeconds),
    builder: (_, controller) {
      return Flash(
        barrierDismissible: false,
        controller: controller,
        margin: margin,
        behavior: FlashBehavior.fixed,
        position: FlashPosition.bottom,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        borderColor: borderColor ?? _borderShape.side.color,
        backgroundColor:
            backgroundColor ?? Theme.of(context).snackBarTheme.backgroundColor,
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        child: DefaultTextStyle(
          style: TextStyle(
              color:
                  textColor ?? Theme.of(context).snackBarTheme.actionTextColor),
          child: FlashBar(
            padding: const EdgeInsets.all(25),
            title: Visibility(
              visible: title != null,
              child: TextECA(
                text: title ?? '',
                fontSize: 30,
                color: textColor ??
                    Theme.of(context).snackBarTheme.actionTextColor,
                fontWeight: FontWeight.bold,
                textAlign: textAlign ?? TextAlign.left,
              ),
            ),
            content: Visibility(
              visible: content != null,
              child: TextECA(
                text: content ?? '',
                fontSize: 20,
                color: textColor ??
                    Theme.of(context).snackBarTheme.actionTextColor,
                textAlign: textAlign ?? TextAlign.left,
              ),
            ),
            indicatorColor: Colors.red,
            icon: Icon(
              Icons.info_outline,
              color:
                  textColor ?? Theme.of(context).snackBarTheme.actionTextColor,
              size: 40,
            ),
          ),
        ),
      );
    },
  ).then((_) {
    if (_ != null) {
      _showMessage(message: _.toString(), context: context);
    }
  });
}

void _showMessage({required String message, required BuildContext context}) {
  showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.top,
          behavior: FlashBehavior.fixed,
          child: FlashBar(
            icon: const Icon(
              Icons.face,
              size: 36.0,
              color: Colors.black,
            ),
            content: TextECA(text: message),
          ),
        );
      });
}
