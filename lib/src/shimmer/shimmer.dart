import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerECA extends StatelessWidget {
  final bool isInProcessing;
  final Widget child;

  const ShimmerECA({
    Key? key,
    required this.child,
    required this.isInProcessing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isInProcessing) {
      return child;
    }
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: child,
    );
  }
}
