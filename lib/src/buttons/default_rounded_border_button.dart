import 'package:eca_packages/src/text_and_textformfield/text.dart';
import 'package:flutter/material.dart';

enum IconPositionOfRoundedBorderButton { left, top }

class DefaultRoundedBorderButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final bool? checked;
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
  final IconPositionOfRoundedBorderButton? iconPosition;

  const DefaultRoundedBorderButton({
    Key? key,
    this.text,
    this.backgroundColor,
    this.checked,
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
    this.iconPosition,
  })  : assert(
          (text != null || icon != null) ||
              (icon != null && iconPosition != null) ||
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
          foregroundColor: _definingForegroundColor(),
        ),
        child: _buttonChild(),
        onPressed: onPressed,
      ),
    );
  }

  _buttonForegroundColor() {
    return fontColor;
  }

  _buttonBackgroundColor() {
    if (checked != null) {
      return !checked!
          ? uncheckedColor ?? Colors.transparent
          : checkedColor ?? borderColor ?? Colors.transparent;
    }
    return backgroundColor;
  }

  _buttonBorderColor() {
    if (checked != null) {
      return !checked!
          ? uncheckedColor ?? Colors.transparent
          : checkedColor ?? borderColor ?? Colors.transparent;
    }
    return borderColor;
  }

  _buttonChild() {
    late Flex _rowOrColumnContainer;
    late SizedBox _sizedBox;

    if (iconPosition == IconPositionOfRoundedBorderButton.top) {
      _rowOrColumnContainer = Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
      );
      _sizedBox = SizedBox(height: icon != null ? 20 : 0);
    } else {
      _rowOrColumnContainer = Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
      );
      _sizedBox = SizedBox(width: (icon != null && text != null) ? 10 : 0);
    }

    if (icon != null) {
      _rowOrColumnContainer.children.add(Expanded(child: icon ?? Container()));
    }

    if (icon != null && text != null) {
      _rowOrColumnContainer.children.add(_sizedBox);
    }

    if (text != null) {
      _rowOrColumnContainer.children.add(
        TextECA(
          text: text!,
          textAlign: TextAlign.center,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: checked != null && !checked!
              ? invertedFontColor ?? fontColor
              : fontColor,
        ),
      );
    }
    return _rowOrColumnContainer;
  }

  _definingBorderSide() {
    return MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) {
      Color? _borderColor = borderColor ?? _buttonBorderColor();

      if (states.contains(MaterialState.disabled)) {
        _borderColor = Colors.grey.shade200;
      }

      return BorderSide(
        width: 1,
        color: _borderColor ?? Colors.transparent,
      );
    });
  }

  _definingForegroundColor() {
    return MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade200;
        }
        return _buttonForegroundColor();
      },
    );
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
