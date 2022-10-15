import 'package:flutter/material.dart';

/// **Está pegando uma fonte diferente da utilizada no Theme**
///
// ignore: must_be_immutable
class TextECA extends StatelessWidget {
  late String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final bool requiredOrientation;
  final bool italic;
  final bool underline;
  late TextOverflow? textOverflow;
  final int? maxLines;
  final double? letterSpacing;
  final List<Shadow>? shadows;
  final bool softwrap;
  final String? fontFamily;

  TextECA({
    Key? key,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.requiredOrientation = false,
    this.italic = false,
    this.underline = false,
    this.textOverflow,
    this.maxLines,
    this.letterSpacing,
    this.shadows,
    this.softwrap = false,
    this.fontFamily,
  }) : super(key: key);

  _generateTextSpanChildren() {
    List<TextSpan> children = [];
    children.add(TextSpan(
      text: text,
    ));
    if (requiredOrientation) {
      children.add(
        TextSpan(
          text: '*',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          ),
        ),
      );
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      // softWrap: softwrap,
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.fade,
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          shadows: shadows,
          fontSize:
              (fontSize ?? Theme.of(context).textTheme.caption?.fontSize ?? 14),
          color: color ?? Theme.of(context).textTheme.caption?.color,
          fontWeight: fontWeight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        ),
        children: _generateTextSpanChildren(),
      ),
    );
  }
}
