// ignore_for_file: prefer_const_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDown<T> extends StatelessWidget {
  final String hintText;
  final String? searchHintText;
  // final double maxHeight;
  final T? selectedItem;
  List<T>? items;
  bool Function(T?, T?)? compareFn;
  Function(T?)? onChanged;
  String Function(T?)? itemAsString;
  final Color? fillColor;
  final Color? selectedColorItem;
  final bool enabled;
  final bool showSearchBox;
  bool Function(T, String)? filterFn;
  Future<List<T>> Function(String)? asyncItemsFunction;

  DropDown({
    Key? key,
    required this.hintText,
    // this.maxHeight = 300,
    this.selectedItem,
    this.items,
    required this.compareFn,
    required this.onChanged,
    required this.itemAsString,
    this.fillColor,
    this.selectedColorItem,
    this.enabled = true,
    this.showSearchBox = false,
    this.searchHintText,
    this.filterFn,
    this.asyncItemsFunction,
  })  : assert((items != null && asyncItemsFunction == null) ||
            items == null && asyncItemsFunction != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return DropdownSearch<T>(
        asyncItems: asyncItemsFunction == null ? null : asyncItemsFunction!,
        enabled: enabled,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            fillColor: fillColor ?? Colors.white,
            // labelText: "Modal mode",
            hintText: hintText,
            filled: true,
            // isDense: false,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          ),
        ),
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          itemBuilder: _customPopupItemBuilder,
          fit: FlexFit.loose,
          showSearchBox: showSearchBox,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: searchHintText ?? '',
              filled: true,
            ),
          ),
        ),
        onChanged: onChanged,
        selectedItem: selectedItem,
        compareFn: compareFn,
        itemAsString: itemAsString,
        dropdownBuilder: _customDropDown,
        filterFn: filterFn,
      );
    } else {
      final List<T> itemsSync = items!;
      return DropdownSearch<T>(
        items: itemsSync,
        enabled: enabled,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            fillColor: fillColor ?? Colors.white,
            // labelText: "Modal mode",
            hintText: hintText,
            filled: true,
            // isDense: false,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          ),
        ),
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          itemBuilder: _customPopupItemBuilder,
          fit: FlexFit.loose,
          showSearchBox: showSearchBox,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: searchHintText ?? '',
              filled: true,
            ),
          ),
        ),
        onChanged: onChanged,
        selectedItem: selectedItem,
        compareFn: compareFn,
        itemAsString: itemAsString,
        dropdownBuilder: _customDropDown,
        filterFn: filterFn,
      );
    }
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
