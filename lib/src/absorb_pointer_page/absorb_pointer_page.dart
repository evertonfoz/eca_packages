import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class AbsorbPointerPageWidget extends StatelessWidget {
  final bool isInProcessing;
  final Widget child;
  final double? opacity;
  final bool blur;

  const AbsorbPointerPageWidget({
    Key? key,
    required this.isInProcessing,
    required this.child,
    this.opacity,
    this.blur = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isInProcessing) {
      var absorbPointer = AbsorbPointer(
        child: Opacity(
          opacity: opacity ?? 0.9,
          child: child,
        ),
      );

      if (blur) {
        return Blur(blur: 1, child: absorbPointer);
      }
      return absorbPointer;
    }
    return child;
  }
}
