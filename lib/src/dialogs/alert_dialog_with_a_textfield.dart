import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

class AlertDialogWithATextFieldWidget extends StatefulWidget {
  final Widget title;
  final Widget content;
  final String okButtonText;
  final String cancelButtonText;
  final MaterialColor? buttonsColor;
  final Color backgroundColor;
  final Color textButtonColor;
  final Color hoverColor;
  final Function? onOkButtonPressed;
  final Color? cancelButtonColor;
  final Color? okButtonColor;

  const AlertDialogWithATextFieldWidget({
    Key? key,
    required this.title,
    required this.content,
    this.okButtonText = 'OK',
    this.cancelButtonText = 'Cancelar',
    this.buttonsColor,
    this.backgroundColor = Colors.white,
    this.textButtonColor = Colors.white,
    this.hoverColor = Colors.blue,
    this.onOkButtonPressed,
    this.cancelButtonColor,
    this.okButtonColor,
  }) : super(key: key);

  @override
  State<AlertDialogWithATextFieldWidget> createState() =>
      _AlertDialogWithATextFieldWidgetState();
}

class _AlertDialogWithATextFieldWidgetState
    extends State<AlertDialogWithATextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AlertDialog(
          backgroundColor: widget.backgroundColor,
          // contentPadding: EdgeInsets.zero,
          // titlePadding: EdgeInsets.zero,
          title: widget.title,
          content: widget.content,
          actions: <Widget>[
            DefaultRoundedBorderButton(
              fontColor: widget.textButtonColor,
              fontWeight: FontWeight.normal,
              radius: 10,
              onPressed: () => Navigator.of(context).pop(),
              text: widget.cancelButtonText,
              textBottomPadding: 6,
              height: 42,
              backgroundColor: widget.buttonsColor != null
                  ? widget.buttonsColor!.shade400
                  : widget.cancelButtonColor ?? Colors.white,
              hoveredColor: widget.hoverColor,
            ),
            DefaultRoundedBorderButton(
              fontColor: widget.textButtonColor,
              fontWeight: FontWeight.normal,
              radius: 10,
              onPressed: () async {
                bool result = true;
                if (widget.onOkButtonPressed != null) {
                  result = await widget.onOkButtonPressed!();
                }
                if (result) {
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
              text: widget.okButtonText,
              textBottomPadding: 6,
              height: 42,
              backgroundColor: widget.buttonsColor != null
                  ? widget.buttonsColor!.shade400
                  : widget.cancelButtonColor ?? Colors.white,
              hoveredColor: widget.hoverColor,
            )
          ]),
    );
  }
}
