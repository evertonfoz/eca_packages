import 'package:flutter/material.dart';

import '../../eca_packages.dart';

final List<PopupMenuEntry> _itemsPopupMenuEntry = [];

popupCreateMenuECA({
  PopupMenuTitleModelECA? title,
  required List<PopupMenuItemModelECA> items,
  required BuildContext context,
  int titleTimesSeparator = 0,
  int itemTimesSeparator = 1,
}) {
  _itemsPopupMenuEntry.clear();
  if (title != null) {
    _itemsPopupMenuEntry.add(popupMenuTitleECA(context: context, title: title));
  }
  for (int i = 0; i < titleTimesSeparator; i++) {
    _itemsPopupMenuEntry.add(popupMenuSeparatorECA(height: 2));
  }

  for (int i = 0; i < items.length; i++) {
    _itemsPopupMenuEntry
        .add(popupMenuItemECA(context: context, item: items[i]));

    // Não é o último e nem é para ter separador duplo
    // if ((i != (items.length) - 2) && (!items[i].doubleSeparatorBefore)) {
    //   for (int j = 0; j < itemTimesSeparator; j++) {
    //     _itemsPopupMenuEntry.add(popupMenuSeparatorECA(height: 2));
    //   }
    // }

    // É para ter separador duplo
    if (items[i].doubleSeparatorBefore) {
      for (int k = 0; k < titleTimesSeparator; k++) {
        _itemsPopupMenuEntry.add(popupMenuSeparatorECA(height: 2));
      }
    }
  }

  return _itemsPopupMenuEntry;
}

popupMenuTitleECA<T>({
  required BuildContext context,
  required PopupMenuTitleModelECA title,
}) {
  return PopupMenuItem<T>(
    child: Center(
      child: TextECA(
        text: title.text,
        fontSize: title.fontSize ?? 34,
        fontWeight: title.fontWeight ?? FontWeight.bold,
        color: title.color ?? Theme.of(context).primaryColor,
      ),
    ),
  );
}

popupMenuItemECA<T>({
  required BuildContext context,
  required PopupMenuItemModelECA item,
}) {
  return PopupMenuItem<T>(
    value: item.value as T,
    child: Container(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: item.iconSize ?? 24,
              child: IconECA(
                size: item.iconSize ?? 24,
                color: item.color ?? Theme.of(context).primaryColor,
                icon: item.icon,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 3,
            child: TextECA(
              text: item.text,
              fontSize: item.fontSize ?? 24,
              fontWeight: item.fontWeight ?? FontWeight.bold,
              color: item.color ?? Theme.of(context).primaryColor,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    ),
  );
}

popupMenuSeparatorECA({double height = 2}) {
  return PopupMenuDivider(height: height);
}
