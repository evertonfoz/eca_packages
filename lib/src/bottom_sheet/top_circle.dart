import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetTopCircleECA extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const ModalBottomSheetTopCircleECA({
    Key? key,
    required this.backgroundColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Consts.padding,
      right: Consts.padding,
      // top: -10,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: Consts.avatarRadius,
        child: child,
      ),
    );
  }
}
