import 'package:flutter/material.dart';

const double kAppBarContainerWidth = 100;
const double kAppBarContainerHeight = 100;

class AppBarContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;

  const AppBarContainer({
    Key? key,
    this.width = kAppBarContainerWidth,
    this.height = kAppBarContainerHeight,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: child ?? Container(),
    );
  }
}
