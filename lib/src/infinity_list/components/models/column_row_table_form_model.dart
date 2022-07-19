import 'package:flutter/material.dart';

class ColumnRowTableFormModel {
  final String text;
  final String? name;
  double width;
  bool isExpanded;
  bool isThereAfterSeparator;
  TextAlign textAlign;
  bool isTheSelectedOrderBy;
  bool isAscendentOrder;
  bool isOrdered;
  VoidCallback? onOrderTap;

  ColumnRowTableFormModel({
    required this.text,
    this.width = 120,
    this.isExpanded = false,
    this.isThereAfterSeparator = true,
    this.textAlign = TextAlign.left,
    this.isTheSelectedOrderBy = false,
    this.isAscendentOrder = true,
    this.isOrdered = false,
    this.onOrderTap,
    this.name,
  });
}
