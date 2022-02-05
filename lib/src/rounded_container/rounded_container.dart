import 'package:flutter/material.dart';

class RoundedContainerECA extends StatelessWidget {
  final double radius;
  final EdgeInsets edgeInsets;
  final Widget child;
  final Color? backgroundColor;
  final Color borderColor;

  const RoundedContainerECA({
    Key? key,
    this.radius = 10,
    this.edgeInsets =
        const EdgeInsets.only(left: 30.0, right: 30, top: 8, bottom: 8),
    required this.child,
    this.backgroundColor,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius,
          ),
        ),
      ),
      child: Padding(
        padding: edgeInsets,
        child: child,
      ),
    );
  }
}
