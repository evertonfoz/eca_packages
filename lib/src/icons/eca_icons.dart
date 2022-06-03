import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const IconData kIconBell = FontAwesomeIcons.bell;
const IconData kIconProfile = FontAwesomeIcons.user;
const IconData kIconCalendar = FontAwesomeIcons.calendar;
const IconData kIconAbout = FontAwesomeIcons.info;
const IconData kIconExit = FontAwesomeIcons.doorOpen;
const IconData kIconArrowBack = FontAwesomeIcons.arrowLeft;

class IconECA extends StatelessWidget {
  final Color? color;
  final double? size;
  final IconData icon;

  const IconECA({
    Key? key,
    this.color,
    this.size,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      color: color ?? Theme.of(context).textTheme.caption?.color,
      size: size ?? 32,
    );
  }
}
