import 'package:flutter/material.dart';

import '../buttons/default_rounded_border_button.dart';
import '../buttons/default_text_button.dart';

class WelcomePageNavigationButtons extends StatelessWidget {
  final int currentPageNumber;
  final int lastPageNumber;
  final VoidCallback onJumpButtonPressed;
  final VoidCallback onNextPagePressed;
  final MaterialColor? foregroundColor;
  final MaterialColor? backgroundColor;

  const WelcomePageNavigationButtons({
    Key? key,
    required this.currentPageNumber,
    required this.lastPageNumber,
    required this.onJumpButtonPressed,
    required this.onNextPagePressed,
    this.backgroundColor,
    this.foregroundColor,
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
        text: "Pular",
        onPressed: onJumpButtonPressed,
      ),
    );
  }

  _generateNextButton() {
    return Expanded(
      flex: 2,
      child: DefaultRoundedBorderButton(
        backgroundColor: backgroundColor,
        borderColor: backgroundColor,
        fontColor: foregroundColor,
        icon: Icon(
          Icons.arrow_forward,
          color: foregroundColor,
          size: 36,
        ),
        height: 70,
        onPressed: onNextPagePressed,
        radius: 15,
        // width: 200,
      ),
    );
  }
}
