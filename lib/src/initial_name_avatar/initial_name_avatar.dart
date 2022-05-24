// ignore_for_file: unrelated_type_equality_checks

import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:string_to_hex/string_to_hex.dart';

class InitialNameAvatarECA extends StatelessWidget {
  final String name;
  final double radius;

  const InitialNameAvatarECA({Key? key, required this.name, this.radius = 67})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int colorToAvatar = StringToHex.toColor(name);
    return CircleECA(
      color: Color(colorToAvatar),
      raio: radius,
      child: TextECA(
        text: name.characters.first,
        color: colorToAvatar != Colors.white ? Colors.white : Colors.black,
        fontSize: 36,
      ),
    );
  }
}
