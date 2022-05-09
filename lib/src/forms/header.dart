import 'package:flutter/material.dart';

const kTitleEdgeInsets = EdgeInsets.only(top: 15, bottom: 30);
const kTitleFontSize = 24.0;
const kTitleFontWeight = FontWeight.bold;

const kSubTitleEdgeInsets = EdgeInsets.only(left: 8.0);
const kSubTitleFontSize = 14.0;
const kSubTitleFontWeight = FontWeight.normal;

const kIntermediateTitleFontSize = 23.0;

class FormPageHeader extends StatelessWidget {
  final String text;
  final EdgeInsets edgeInsets;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;


  ///[FormPageHeader] utilizado para a criar um título para uma página.
  const FormPageHeader(
      {Key? key,
      required this.text,
      this.edgeInsets = const EdgeInsets.all(0),
      this.fontSize = kSubTitleFontSize,
      this.fontWeight = kSubTitleFontWeight,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
