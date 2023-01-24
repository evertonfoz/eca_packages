import 'package:eca_packages/eca_packages.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void showBottomSnackBar({
  bool persistent = true,
  EdgeInsets margin = EdgeInsets.zero,
  required BuildContext context,
  int? durationSeconds,
  String? title,
  String? content,
  Color? borderColor,
  Color? backgroundColor,
  Color? textColor,
  TextAlign? textAlign,
  Widget? primaryAction,
  Function? onYesPressed,
  Function? onNoPressed,
  Function? onHide,
  Color? progressIndicatorBackgroundColor,
  Color? progressIndicatorValueColor,
  String? yesButtonText,
  String? noButtonText,
  double titleFontSize = 30,
  double contentFontSize = 20,
  double buttonFontSize = 20,
  IconData iconIndicator = Icons.info_outline,
}) {
  assert(
      (title != null || content != null) &&
          (borderColor != null ||
              Theme.of(context).snackBarTheme.shape.runtimeType ==
                  RoundedRectangleBorder),
      'É preciso informar o título ou conteúdo. informar o borderColor ou ter o shape de SnackBarTheme como RoundedRectangleBorder');
  final RoundedRectangleBorder _borderShape =
      Theme.of(context).snackBarTheme.shape as RoundedRectangleBorder;

  // FocusScope.of(context).unfocus();
  showFlash(
    persistent: durationSeconds == null,
    context: context,
    duration: durationSeconds == null || onYesPressed != null
        ? null
        : Duration(seconds: durationSeconds),
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
            showProgressIndicator: progressIndicatorBackgroundColor != null ||
                progressIndicatorValueColor != null,
            progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
            // progressIndicatorController: _animationController,
            progressIndicatorValueColor: progressIndicatorValueColor != null
                ? AlwaysStoppedAnimation<Color>(progressIndicatorValueColor)
                : null,

            title: Visibility(
              visible: title != null,
              child: TextECA(
                text: title ?? '',
                fontSize: titleFontSize,
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
                fontSize: contentFontSize,
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
            primaryAction: primaryAction,
            actions: onYesPressed == null && onNoPressed == null
                ? null
                : <Widget>[
                    Visibility(
                        visible: onYesPressed != null,
                        child: TextButton(
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(fontSize: buttonFontSize),
                              ),
                            ),
                            onPressed: () {
                              if (onYesPressed != null) {
                                onYesPressed();
                              }
                              controller.dismiss();
                            },
                            child: Text(yesButtonText ?? 'OK'))),
                    Visibility(
                        visible: onNoPressed != null,
                        child: TextButton(
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(fontSize: buttonFontSize),
                              ),
                            ),
                            onPressed: () {
                              if (onNoPressed != null) {
                                onNoPressed();
                              }
                              controller.dismiss();
                            },
                            child: Text(noButtonText ?? 'NÃO'))),
                  ],
          ),
        ),
      );
    },
  ).then((_) {
    if (onHide != null) {
      onHide();
    }

    // _animationController.dispose();
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
