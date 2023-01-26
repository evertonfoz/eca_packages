import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;

import '../../eca_packages.dart';

class IconNotifications extends StatelessWidget {
  final Color? color;
  final double? size;
  final Widget? notificationsWidget;
  final String? textToBadget;
  final Color? colorToTextToBadget;

  const IconNotifications({
    Key? key,
    this.color,
    this.size,
    this.notificationsWidget,
    this.textToBadget,
    this.colorToTextToBadget,
  })  : assert((notificationsWidget != null && color == null && size == null) ||
            (notificationsWidget == null && (color == null || size == null))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return textToBadget != null
        ? Badge(
            badgeContent: TextECA(
              text: textToBadget ?? '',
              color: colorToTextToBadget,
            ),
            //TODO - Após o uso do package badges: ^3.0.0 ou superior, descomentar o próximo campo

            // badgeAnimation: const BadgeAnimation.slide(
            //   toAnimate: true,
            //   animationDuration: Duration(seconds: 1),
            // ),
            //TODO - Após o uso do package badges: ^3.0.0 ou superior, apagar os dois campos abaixo
            animationType: BadgeAnimationType.scale,
            animationDuration: const Duration(seconds: 1),
            child: notificationsWidget ??
                IconECA(icon: kIconBell, color: color ?? colorToTextToBadget),
          )
        : IconECA(icon: kIconBell, color: color ?? colorToTextToBadget);
  }
}
