import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color primaryColor;
  final double fontSize;

  const DefaultTextButton({
    Key? key,
    required this.text,
    this.textColor = Colors.red,
    required this.onPressed,
    this.buttonColor = Colors.transparent,
    required this.primaryColor,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: _buildTextButtonStyleFrom(),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildTextButtonStyleFrom() {
    return TextButton.styleFrom(
      primary: primaryColor,
      backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
