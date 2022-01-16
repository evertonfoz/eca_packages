import 'package:flutter/material.dart';

const double kAppBarContainerWidth = 100;
const double kAppBarContainerHeight = 100;

class AppBarContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final Color? testColor;

  const AppBarContainer({
    Key? key,
    this.width = kAppBarContainerWidth,
    this.height = kAppBarContainerHeight,
    this.child,
    this.testColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: testColor ?? Colors.transparent,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: child ?? Container(),
        ),
      ),
    );
  }
}
