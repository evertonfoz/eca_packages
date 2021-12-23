import 'package:flutter/material.dart';

import '../buttons/default_rounded_border_button.dart';
import '../buttons/default_text_button.dart';

class WelcomePageNavigationButtons extends StatelessWidget {
  final int currentPageNumber;
  final int lastPageNumber;
  final VoidCallback onJumpButtonPressed;
  final VoidCallback onNextPagePressed;
  final Color buttonTextColor;
  final MaterialColor buttonColor;

  const WelcomePageNavigationButtons({
    Key? key,
    required this.currentPageNumber,
    required this.lastPageNumber,
    required this.onJumpButtonPressed,
    required this.onNextPagePressed,
    required this.buttonColor,
    this.buttonTextColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buttons = [];
    if (currentPageNumber != lastPageNumber) {
      _buttons.add(_generateJumpButton());
      _buttons.add(
        const Expanded(flex: 8, child: SizedBox()),
      );
      _buttons.add(_generateNextButton());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
          mainAxisAlignment: currentPageNumber != lastPageNumber
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: _buttons),
    );
  }

  _generateJumpButton() {
    return Expanded(
      flex: 3,
      child: DefaultTextButton(
        textColor: Colors.white54,
        text: "Pular",
        onPressed: onJumpButtonPressed,
        primaryColor: buttonTextColor,
      ),
    );
  }

  _generateNextButton() {
    return Expanded(
      flex: 2,
      child: DefaultRoundedBorderButton(
        backgroundColor: buttonColor.shade400,
        borderColor: buttonColor.shade400,
        icon: Icon(
          Icons.arrow_forward,
          color: buttonTextColor,
          size: 36,
        ),
        height: 70,
        onPressed: onNextPagePressed,
        radius: 15,
      ),
    );
  }
}
