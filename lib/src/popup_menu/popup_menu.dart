import 'package:flutter/material.dart';

import '../../eca_packages.dart';

final List<PopupMenuEntry> _itemsPopupMenuEntry = [];

popupMenuTitleECA<T>({
  required BuildContext context,
  required String title,
  final Color? color,
  final double? fontSize,
  final FontWeight? fontWeight,
}) {
  return PopupMenuItem<T>(
    child: Center(
      child: TextECA(
        text: title,
        fontSize: fontSize ?? 34,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Theme.of(context).primaryColor,
      ),
    ),
  );
}

popupMenuItemECA<T>({
  required BuildContext context,
  required IconData icon,
  required String text,
  dynamic value,
  Color? color,
  double? iconSize,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return PopupMenuItem<T>(
    child: Container(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          IconECA(
            size: iconSize ?? 24,
            color: color ?? Theme.of(context).primaryColor,
            icon: icon,
          ),
          const SizedBox(width: 15),
          TextECA(
            text: text,
            fontSize: fontSize ?? 24,
            fontWeight: fontWeight ?? FontWeight.bold,
            color: color ?? Theme.of(context).primaryColor,
          ),
        ],
      ),
    ),
    value: value as T,
  );
}
