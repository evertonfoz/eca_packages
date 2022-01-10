import 'package:flutter/material.dart';

class AbsorbPointerPageWidget extends StatelessWidget {
  final bool isInProcessing;
  final Widget child;

  const AbsorbPointerPageWidget({
    Key? key,
    required this.isInProcessing,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isInProcessing) {
      return AbsorbPointer(
        child: Opacity(
          opacity: 0.9,
          child: child,
        ),
      );
    }
    return child;
  }
}
