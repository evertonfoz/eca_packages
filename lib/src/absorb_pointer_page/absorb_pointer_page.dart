import 'package:blur/blur.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

class AbsorbPointerPageWidget extends StatelessWidget {
  final bool isInProcessing;
  final Widget child;
  final double? opacity;
  final bool blur;
  final bool useSchimmer;

  const AbsorbPointerPageWidget({
    Key? key,
    required this.isInProcessing,
    required this.child,
    this.opacity,
    this.blur = true,
    this.useSchimmer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildAbsorbPointerChild();
  }

  _buildAbsorbPointerChild() {
    if (useSchimmer && isInProcessing) {
      return ShimmerECA(
        child: child,
        isInProcessing: isInProcessing,
      );
    } else if (!isInProcessing) {
      return child;
    }

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
}
