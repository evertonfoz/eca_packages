import 'package:flutter/material.dart';

class CircleECA extends StatelessWidget {
  final double raio;
  final Color? color;
  final Widget? child;

  const CircleECA({
    Key? key,
    required this.raio,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: raio,
      height: raio,
      decoration: BoxDecoration(
        color: color ??
            Theme.of(context).floatingActionButtonTheme.foregroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: child ?? Container(),
      ),
    );
  }
}
