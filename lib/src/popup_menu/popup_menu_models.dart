import 'package:flutter/material.dart';

class PopupMenuTitleModelECA {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  PopupMenuTitleModelECA({
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });
}

class PopupMenuItemModelECA<T> {
  final IconData icon;
  final String text;
  final dynamic value;
  final Color? color;
  final double? fontSize;
  final double? iconSize;
  final FontWeight? fontWeight;
  final bool doubleSeparatorBefore;

  PopupMenuItemModelECA({
    required this.text,
    required this.icon,
    required this.value,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.iconSize,
    this.doubleSeparatorBefore = false,
  });
}
