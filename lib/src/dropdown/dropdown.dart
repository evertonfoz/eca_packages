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

  DropDown({
    Key? key,
    required this.hintText,
    // this.maxHeight = 300,
    this.selectedItem,
    required this.items,
    required this.compareFn,
    required this.onChanged,
    required this.itemAsString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('itemAsString $itemAsString');
    return DropdownSearch<T>(
      dropdownSearchDecoration: InputDecoration(
        fillColor: Colors.green,
        filled: true,
        hintText: hintText,
        labelText: "Menu mode multiSelection*",
        contentPadding: const EdgeInsets.only(left: 10, top: 4),
        border: const OutlineInputBorder(),
      ),
      searchFieldProps: TextFieldProps(
        // controller: _userEditTextController,
        decoration: const InputDecoration(
          labelStyle: TextStyle(color: Colors.indigo),
          // suffixIcon: IconButton(
          //   icon: const Icon(Icons.clear),
          //   onPressed: () {
          //     // _userEditTextController.clear();
          //   },
          // ),
        ),
      ),
      popupSafeArea: const PopupSafeAreaProps(top: false),
      popupBackgroundColor: Colors.yellow,
      maxHeight: items.length * 57,
      popupShape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        side: BorderSide(
          color: Colors.red.shade200,
          width: 1.0,
        ),
      ),
      mode: Mode.MENU,
      showSelectedItems: true,
      onChanged: onChanged,
      selectedItem: null,
      items: items,
      compareFn: compareFn,
      popupItemBuilder: _customPopupItemBuilder,
      itemAsString: itemAsString,
      dropdownBuilder: _customDropDown,
    );
  }

  Widget _customDropDown(BuildContext context, T? item) {
    late String? itemName;
    String? itemUrlImage;

    if (item == null) {
      return SizedBox(child: TextECA(text: hintText));
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
        title: Text(itemName),
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
          color: isSelected ? Colors.blue : null,
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
