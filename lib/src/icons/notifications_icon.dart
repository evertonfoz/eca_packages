import 'package:badges/badges.dart';
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
            (notificationsWidget == null && (color == null || size == null)) &&
                (textToBadget != null && colorToTextToBadget != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return textToBadget != null
        ? Badge(
            badgeContent: TextECA(
              text: textToBadget ?? '',
              color: colorToTextToBadget,
            ),
            animationType: BadgeAnimationType.scale,
            animationDuration: const Duration(seconds: 2),
            child: notificationsWidget ??
                const IconECA(
                  icon: kIconBell,
                ),
          )
        : const IconECA(
            icon: kIconBell,
          );
  }
}
