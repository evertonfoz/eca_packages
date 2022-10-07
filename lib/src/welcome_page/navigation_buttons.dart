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
  final String jumpButtonText;
  final double height;

  const WelcomePageNavigationButtons({
    Key? key,
    required this.currentPageNumber,
    required this.lastPageNumber,
    required this.onJumpButtonPressed,
    required this.onNextPagePressed,
    required this.jumpButtonText,
    this.backgroundColor,
    this.foregroundColor,
    this.withNotJumpButton = true,
    this.radius = 15,
    this.fontSize,
    this.height = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buttons = [];
    if (withNotJumpButton && currentPageNumber != lastPageNumber) {
      _buttons.add(_generateNextButton());
    }
    if (!withNotJumpButton && currentPageNumber != lastPageNumber) {
      _buttons.add(_generateJumpButton(context));
      _buttons.add(
        const Expanded(flex: 6, child: SizedBox()),
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

  _generateJumpButton(BuildContext context) {
    return Expanded(
      flex: 3,
      child: FittedBox(
        child: DefaultTextButton(
          fontSize: fontSize,
          text: jumpButtonText,
          onPressed: onJumpButtonPressed,
        ),
      ),
    );
  }

  _generateNextButton() {
    return Expanded(
      flex: withNotJumpButton ? 1 : 2,
      child: DefaultRoundedBorderButton(
        height: height,
        // width: 150,
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
        // height: 70,
        onPressed: onNextPagePressed,
        radius: radius,
        // width: double.maxFinite,
      ),
    );
  }
}
