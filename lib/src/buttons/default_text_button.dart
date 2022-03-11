import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? primaryColor;
  final double? fontSize;

  const DefaultTextButton({
    Key? key,
    required this.text,
    this.foregroundColor,
    this.backgroundColor,
    this.primaryColor,
    required this.onPressed,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: _buildTextButtonStyleFrom(),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 18,
          // color: foregroundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildTextButtonStyleFrom() {
    return TextButton.styleFrom(
      primary: foregroundColor,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
