import 'package:flutter/material.dart';

class PopupMenuTitleModelECA {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  PopupMenuTitleModelECA({
    required this.title,
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
  final FontWeight? fontWeight;

  PopupMenuItemModelECA({
    required this.text,
    required this.icon,
    required this.value,
    this.color,
    this.fontSize,
    this.fontWeight,
  });
}
