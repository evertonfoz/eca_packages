// ignore_for_file: prefer_const_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDown<T> extends StatelessWidget {
  final String hintText;
  // final double maxHeight;
  final T? selectedItem;
  List<T> items;
  bool Function(T?, T?)? compareFn;
  Function(T?)? onChanged;
  String Function(T?)? itemAsString;
  final Color? fillColor;
  final Color? selectedColorItem;
  final bool enabled;

  DropDown({
    Key? key,
    required this.hintText,
    // this.maxHeight = 300,
    this.selectedItem,
    required this.items,
    required this.compareFn,
    required this.onChanged,
    required this.itemAsString,
    this.fillColor,
    this.selectedColorItem,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      enabled: enabled,
      dropdownSearchDecoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.indigo),
        contentPadding: const EdgeInsets.only(left: 10, top: 4),
      ),
      popupProps: PopupProps.menu(
          showSelectedItems: true,
          itemBuilder: _customPopupItemBuilder,
          fit: FlexFit.loose),
      onChanged: onChanged,
      selectedItem: selectedItem,
      items: items,
      compareFn: compareFn,
      itemAsString: itemAsString,
      dropdownBuilder: _customDropDown,
    );
  }

  Widget _customDropDown(BuildContext context, T? item) {
    late String? itemName;
    String? itemUrlImage;

    if (item == null) {
      return SizedBox(
        child: TextECA(
          text: hintText,
          textAlign: TextAlign.start,
          fontSize: 16,
        ),
      );
    }

    if (!item.toString().contains('##')) {
      itemName = item.toString();
    } else {
      itemName =
          item.toString().substring(0, item.toString().indexOf('##')).trim();
      itemUrlImage = item
          .toString()
          .substring(item.toString().indexOf('##') + 2, item.toString().length)
          .trim();
    }

    return SizedBox(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: itemUrlImage == null
            ? null
            : CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(itemUrlImage),
              ),
        title: TextECA(
          text: itemName,
          textAlign: TextAlign.start,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _customPopupItemBuilder(
      BuildContext context, T? item, bool isSelected) {
    late String? itemName;
    String? itemUrlImage;

    if (!item.toString().contains('##')) {
      itemName = item?.toString();
    } else {
      itemName =
          item?.toString().substring(0, item.toString().indexOf('##')).trim();
      itemUrlImage = item
          ?.toString()
          .substring(item.toString().indexOf('##') + 2, item.toString().length)
          .trim();
    }

    return SizedBox(
      child: ListTile(
        leading: itemUrlImage == null
            ? null
            : CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(itemUrlImage),
              ),
        title: TextECA(
          text: itemName ?? '',
          color: isSelected ? selectedColorItem ?? Colors.blue : null,
          textAlign: TextAlign.start,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        trailing: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.brown,
              )
            : null,
      ),
    );
  }
}
