import 'package:eca_packages/src/text_and_textformfield/text.dart';
import 'package:flutter/material.dart';

enum IconPositionOfRoundedBorderButton { left, top }

// ignore: must_be_immutable
class DefaultRoundedBorderButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? hoveredColor;
  final bool? checked;
  final VoidCallback? onPressed;
  final Image? image;
  final Icon? icon;
  final double height;
  final double? width;
  final double? fontSize;
  final Color? fontColor;
  final Color? borderColor;
  final Color? invertedFontColor;
  final double? radius;
  final Color? checkedColor;
  final Color? uncheckedColor;
  final FontWeight fontWeight;
  final IconPositionOfRoundedBorderButton? iconPosition;
  final MainAxisAlignment? rowMainAxisAlignment;
  final MainAxisSize? rowMainAxisSize;
  final TextAlign textAlign;

  BuildContext? _context;

  final double textBottomPadding;

  DefaultRoundedBorderButton({
    Key? key,
    this.text,
    this.backgroundColor,
    this.hoveredColor,
    this.checked,
    this.onPressed,
    this.icon,
    this.image,
    this.height = 32,
    this.width = 111,
    this.fontSize,
    this.fontColor,
    this.invertedFontColor,
    this.borderColor,
    this.radius = 30,
    this.checkedColor,
    this.uncheckedColor,
    this.fontWeight = FontWeight.bold,
    this.iconPosition,
    this.textBottomPadding = 0,
    this.rowMainAxisAlignment,
    this.rowMainAxisSize,
    this.textAlign = TextAlign.start,
  })  : assert(
          (icon == null && image == null) ||
              (icon != null && image != null ||
                  icon == null && image != null) ||
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
    _context = context;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
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
    return backgroundColor ??
        Theme.of(_context!).elevatedButtonTheme.style!.backgroundColor;
  }

  _buttonHoveredColor() {
    if (checked != null) {
      return !checked!
          ? uncheckedColor ?? Colors.transparent
          : checkedColor ?? borderColor ?? Colors.transparent;
    }
    if (hoveredColor != null) {
      return hoveredColor;
    } else if (backgroundColor != null) {
      return (backgroundColor as MaterialColor).shade900;
    } else {
      return null;
    }
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
        children: [],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
      );
      _sizedBox = SizedBox(height: icon != null ? 20 : 0);
    } else {
      _rowOrColumnContainer = Row(
        children: [],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: rowMainAxisAlignment ?? MainAxisAlignment.center,
        mainAxisSize: rowMainAxisSize ?? MainAxisSize.min,
      );
      _sizedBox = SizedBox(width: (icon != null && text != null) ? 10 : 0);
    }

    if (icon != null && text != null) {
      _rowOrColumnContainer.children.add(icon ?? Container());
      // _rowOrColumnContainer.children.add(Expanded(child: icon ?? Container()));
    }

    // if (image != null && text != null) {
    //   _rowOrColumnContainer.children.add(image ?? Container());
    //   // _rowOrColumnContainer.children.add(Expanded(child: icon ?? Container()));
    // }
//TODO Avaliar como fica o botão
    if (icon != null && image != null && text == null) {
      // _rowOrColumnContainer.children.add(icon ?? Container());
      _rowOrColumnContainer.children.add(Expanded(child: icon ?? Container()));
    }

    if (image != null) {
      if (iconPosition == IconPositionOfRoundedBorderButton.top) {
        _rowOrColumnContainer.children.add(Center(child: image ?? Container()));
      } else {
        _rowOrColumnContainer.children
            .add(Expanded(child: image ?? Container()));
      }
    }

    if ((text != null && text != '') && (icon != null || image != null)) {
      _rowOrColumnContainer.children.add(_sizedBox);
    }

    if (text != null && text != '') {
      _rowOrColumnContainer.children.add(
        Padding(
          padding: EdgeInsets.only(bottom: textBottomPadding),
          child: TextECA(
            text: text!,
            textAlign: textAlign,
            fontSize: fontSize ?? 20,
            fontWeight: fontWeight,
            color: checked != null && !checked!
                ? invertedFontColor ?? fontColor
                : fontColor ?? Theme.of(_context!).primaryColor,
          ),
        ),
      );
    }
    return _rowOrColumnContainer;
  }

  _definingBorderSide() {
    if (borderColor != null) {
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
  }

  _definingForegroundColor() {
    if (fontColor != null) {
      return MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey.shade200;
          }
          return _buttonForegroundColor();
        },
      );
    }
  }

  _definingBackgroundColor() {
    if (backgroundColor != null) {
      return MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey.shade200;
          } else if (states.contains(MaterialState.hovered)) {
            return _buttonHoveredColor();
          }
          return _buttonBackgroundColor();
        },
      );
    }
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
