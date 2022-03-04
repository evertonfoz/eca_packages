import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextECA extends StatelessWidget {
  late String text;
  final TextAlign? textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final bool requiredOrientation;
  final bool italic;
  late TextOverflow? textOverflow;
  final int? maxLines;

  TextECA({
    Key? key,
    required this.text,
    this.textAlign,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.requiredOrientation = false,
    this.italic = false,
    this.textOverflow,
    this.maxLines,
  }) : super(key: key);

  _generateTextSpanChildren() {
    List<TextSpan> children = [];
    children.add(TextSpan(
      text: text,
    ));
    if (requiredOrientation) {
      children.add(
        const TextSpan(
          text: '*',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.fade,
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: color ?? Theme.of(context).textTheme.caption?.color,
          fontWeight: fontWeight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        ),
        children: _generateTextSpanChildren(),
      ),
    );
  }
}
