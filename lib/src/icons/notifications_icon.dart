import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

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
        ? badge.Badge(
            badgeAnimation: const badge.BadgeAnimation.scale(),
            badgeContent: TextECA(
              text: textToBadget ?? '',
              color: colorToTextToBadget,
            ),
            // animationType: badge.BadgeAnimationType.scale,
            // animationDuration: const Duration(seconds: 1),
            child: notificationsWidget ??
                IconECA(icon: kIconBell, color: color ?? colorToTextToBadget),
          )
        : notificationsWidget ??
            IconECA(icon: kIconBell, color: color ?? colorToTextToBadget);
  }
}
