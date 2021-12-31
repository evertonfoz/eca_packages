import 'package:eca_packages/src/buttons/default_rounded_border_button.dart';
import 'package:flutter/material.dart';

class WelcomePageAccessButtons extends StatelessWidget {
  final Color? topButtonTextColor;
  final Color? topButtonBorderColor;
  final Color? topButtonBackgroundColor;
  final String topButtonCaption;
  final Color? bottomButtonTextColor;
  final Color? bottomButtonBorderColor;
  final Color? bottomButtonBackgroundColor;
  final String bottomButtonCaption;
  final VoidCallback onTopButtonPressed;
  final VoidCallback onBottomButtonPressed;
  final double? radius;
  final double percentToWidth;

  const WelcomePageAccessButtons({
    Key? key,
    this.topButtonTextColor,
    this.topButtonBorderColor,
    this.topButtonBackgroundColor,
    required this.onTopButtonPressed,
    this.bottomButtonTextColor,
    this.bottomButtonBorderColor,
    this.bottomButtonBackgroundColor,
    required this.onBottomButtonPressed,
    required this.topButtonCaption,
    required this.bottomButtonCaption,
    this.radius,
    this.percentToWidth = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DefaultRoundedBorderButton(
            // backgroundColor: topButtonBackgroundColor,
            // fontColor: topButtonTextColor,
            fontSize: 20,
            text: topButtonCaption,
            // checked: true,
            width: MediaQuery.of(context).size.width * percentToWidth,
            // borderColor: topButtonBorderColor,
            height: 60,
            onPressed: onTopButtonPressed,
            radius: radius ?? 5,
          ),
          const SizedBox(height: 20),
          DefaultRoundedBorderButton(
            backgroundColor: bottomButtonBackgroundColor,
            borderColor: bottomButtonBorderColor,
            fontColor: bottomButtonTextColor,
            // backgroundColor: loginButtonBackgroundColor,
            // fontColor: loginButtonTextColor,
            // borderColor: loginButtonBorderColor,
            // checked: true,
            text: bottomButtonCaption,
            fontSize: 20,
            width: MediaQuery.of(context).size.width * percentToWidth,
            height: 60,
            onPressed: onBottomButtonPressed,
            radius: radius ?? 5,
          )
        ],
      ),
    );
  }
}
