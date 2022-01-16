import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconBell extends StatelessWidget {
  final Color? color;
  final double? size;

  const IconBell({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      FontAwesomeIcons.bell,
      color: color ?? Theme.of(context).textTheme.caption?.color,
      size: size ?? 32,
    );
  }
}
