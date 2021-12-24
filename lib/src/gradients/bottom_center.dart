import 'package:flutter/material.dart';

class GradientBottomCenter extends StatelessWidget {
  final double height;
  final List<Color> colors;

  const GradientBottomCenter(
      {Key? key, required this.height, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 330,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: colors,
          ),
        ),
      ),
    );
  }
}
