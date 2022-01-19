import 'package:flutter/material.dart';

class CircleECA extends StatelessWidget {
  final double raio;
  final Color? color;

  const CircleECA({
    Key? key,
    required this.raio,
    this.color,
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
        child: const Center(
          child: Text('1'),
        ));
  }
}
