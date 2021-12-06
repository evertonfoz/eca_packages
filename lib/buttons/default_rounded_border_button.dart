import 'package:flutter/material.dart';

class DefaultRoundedBorderButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final bool checked;
  final VoidCallback? onPressed;
  final Icon? icon;
  final double height;
  final double width;
  final double fontSize;
  final Color fontColor;
  final Color borderColor;
  final Color invertedFontColor;
  final double radius;
  final Color checkedColor;
  final Color uncheckedColor;

  const DefaultRoundedBorderButton({
    Key? key,
    this.text,
    this.backgroundColor,
    this.checked = false,
    this.onPressed,
    this.icon,
    this.height = 32,
    this.width = 111,
    this.fontSize = 16,
    required this.fontColor,
    required this.invertedFontColor,
    required this.borderColor,
    this.radius = 30,
    required this.checkedColor,
    required this.uncheckedColor,
  })  : assert(
            (text != null && icon == null) || (text == null && icon != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
          side: MaterialStateBorderSide.resolveWith((states) {
            return BorderSide(
              width: 1,
              color: borderColor,
            );
          }),
          // foregroundColor: MaterialStateProperty.all<Color>(
          //     !checked ? Colors.grey.shade900 : kPrimaryColor),
          backgroundColor: MaterialStateProperty.all<Color>(_backgroundColor()),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.blue.withOpacity(0.04);
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return Colors.blue.withOpacity(0.12);
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        child: _buttonChild(),
        onPressed: onPressed,
      ),
    );
  }

  _backgroundColor() {
    if (backgroundColor != null) {
      return backgroundColor;
    }
    return !checked ? uncheckedColor : checkedColor;
    // return !checked ? Colors.grey.shade100 : kHomeAppBarColor;
  }

  _buttonChild() {
    if (text != null) {
      return Text(
        text!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: !checked ? invertedFontColor : fontColor,
        ),
      );
    } else {
      return icon;
    }
  }
}
