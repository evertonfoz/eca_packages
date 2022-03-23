import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

class WelcomePageNavigationButtons extends StatelessWidget {
  final int currentPageNumber;
  final int lastPageNumber;
  final VoidCallback onJumpButtonPressed;
  final VoidCallback onNextPagePressed;
  final Color? foregroundColor;
  final MaterialColor? backgroundColor;
  final bool withNotJumpButton;
  final double radius;
  final double? fontSize;

  const WelcomePageNavigationButtons({
    Key? key,
    required this.currentPageNumber,
    required this.lastPageNumber,
    required this.onJumpButtonPressed,
    required this.onNextPagePressed,
    this.backgroundColor,
    this.foregroundColor,
    this.withNotJumpButton = true,
    this.radius = 15,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buttons = [];
    if (withNotJumpButton && currentPageNumber != lastPageNumber) {
      _buttons.add(_generateNextButton());
    }
    if (!withNotJumpButton && currentPageNumber != lastPageNumber) {
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
        fontSize: fontSize,
        text: "Pular",
        onPressed: onJumpButtonPressed,
      ),
    );
  }

  _generateNextButton() {
    return Expanded(
      flex: withNotJumpButton ? 1 : 2,
      child: DefaultRoundedBorderButton(
        fontSize: fontSize,
        backgroundColor: backgroundColor,
        borderColor: backgroundColor,
        fontColor: foregroundColor,
        text: withNotJumpButton ? 'Próximo' : '',
        icon: !withNotJumpButton
            ? Icon(
                Icons.arrow_forward,
                color: foregroundColor,
                size: 32,
              )
            : null,
        height: 70,
        onPressed: onNextPagePressed,
        radius: radius,
        // width: 200,
      ),
    );
  }
}
