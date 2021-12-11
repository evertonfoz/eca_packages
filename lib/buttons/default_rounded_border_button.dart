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
  final Color? fontColor;
  final Color? borderColor;
  final Color? invertedFontColor;
  final double radius;
  final Color? checkedColor;
  final Color? uncheckedColor;
  final FontWeight fontWeight;

  const DefaultRoundedBorderButton({
    Key? key,
    this.text,
    this.backgroundColor,
    this.checked = false,
    this.onPressed,
    this.icon,
    this.height = 32,
    this.width = 111,
    this.fontSize = 20,
    this.fontColor,
    this.invertedFontColor,
    this.borderColor,
    this.radius = 30,
    this.checkedColor,
    this.uncheckedColor,
    this.fontWeight = FontWeight.bold,
  })  : assert(
          (text != null && icon == null) ||
              (text == null && icon != null) ||
              (text != null && fontColor == null) ||
              (backgroundColor != null && checkedColor != null) ||
              (backgroundColor != null && uncheckedColor != null) ||
              (backgroundColor == null &&
                  (checkedColor == null || uncheckedColor == null)),
        ),
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
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          side: _definingBorderSide(),
          backgroundColor: _definingBackgroundColor(),
          overlayColor: _definingOverlayColor(),
        ),
        child: _buttonChild(),
        onPressed: onPressed,
      ),
    );
  }

  _buttonBackgroundColor() {
    if (backgroundColor != null) {
      return backgroundColor;
    }
    return !checked
        ? uncheckedColor ?? Colors.transparent
        : checkedColor ?? borderColor ?? Colors.transparent;
  }

  _buttonBorderColor() {
    if (borderColor != null) {
      return borderColor;
    }
    return !checked
        ? uncheckedColor ?? Colors.transparent
        : checkedColor ?? borderColor ?? Colors.transparent;
  }

  _buttonChild() {
    if (text != null) {
      return Text(
        text!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: !checked ? invertedFontColor ?? fontColor : fontColor,
        ),
      );
    } else {
      return icon;
    }
  }

  _definingBorderSide() {
    return MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          width: 1,
          color: Colors.grey.shade200,
        );
      }

      return BorderSide(
        width: 1,
        color: borderColor ?? _buttonBorderColor(),
      );
    });
  }

  _definingBackgroundColor() {
    return MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade200;
        }
        return _buttonBackgroundColor();
      },
    );
  }

  _definingOverlayColor() {
    return MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.blue.withOpacity(0.04);
        }
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed)) {
          return Colors.blue.withOpacity(0.12);
        }
        return null;
      },
    );
  }
}
