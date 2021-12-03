import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CircularTextAndGifProcessIndicator extends StatelessWidget {
  final MaterialColor loadingColor;
  final String text1;
  final String? text2;
  final String? text3;
  final double fontSize;
  final double textHeight;

  const CircularTextAndGifProcessIndicator({
    Key? key,
    required this.loadingColor,
    required this.text1,
    this.text2,
    this.text3,
    this.fontSize = 20,
    this.textHeight = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GFLoader(
          type: GFLoaderType.circle,
          loaderColorOne: loadingColor.shade100,
          loaderColorTwo: loadingColor.shade300,
          loaderColorThree: loadingColor.shade600,
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: textHeight,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: fontSize,
              color: loadingColor.shade700,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(text1),
                FadeAnimatedText(text2 ?? text1),
                FadeAnimatedText(text3 ?? text1),
              ],
              isRepeatingAnimation: true,
            ),
          ),
        ),
      ],
    );
  }
}
