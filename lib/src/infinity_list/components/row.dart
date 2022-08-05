import 'package:eca_packages/src/infinity_list/enums/sort_method.dart';
import 'package:eca_packages/src/infinity_list/mobx_stores/list_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/column_row_table_form_model.dart';
import 'row_table_form_widget.dart';

class ListRow extends StatelessWidget {
  final List<ColumnRowTableFormModel> columnValues;
  final Function? onOrderTap;
  final bool isAHeader;
  final bool isHovered;
  final Color headerTableFormBackgroundColor;
  final Color headerTableFormTextColor;

  ListRow({
    super.key,
    required this.columnValues,
    this.onOrderTap,
    this.isAHeader = false,
    this.isHovered = false,
    required this.headerTableFormBackgroundColor,
    required this.headerTableFormTextColor,
  });

  final ListPreferencesStore listPreferences =
      Modular.get<ListPreferencesStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return RowTableFormWidget(
        isAHeader: isAHeader,
        isHovered: isHovered,
        // backgroundColor: kHeaderTableFormBackgroundColor,
        textColor: isAHeader ? headerTableFormTextColor : Colors.black,
        timesOfHeightSeparator: 3,
        texts: _buildTexts(),
        headerTableFormBackgroundColor: headerTableFormBackgroundColor,
        headerTableFormTextColor: headerTableFormTextColor,
      );
    });
  }

  _buildTexts() {
    final List<ColumnRowTableFormModel> texts = [];
    for (var columnHeader in columnValues) {
      texts.add(
        ColumnRowTableFormModel(
          name: columnHeader.text,
          isExpanded: columnHeader.isExpanded,
          textAlign: columnHeader.textAlign,
          text: columnHeader.text,
          isOrdered: columnHeader.isOrdered,
          isTheSelectedOrderBy:
              listPreferences.sortProperty == columnHeader.text,
          isAscendentOrder: listPreferences.sortOrder == SortOrderType.asc.text,
          width: columnHeader.width,
          isThereAfterSeparator: columnHeader.isThereAfterSeparator,
          onOrderTap: () {
            if (listPreferences.sortProperty != columnHeader.text) {
              listPreferences.setSortProperty(columnHeader.text);
              listPreferences.setSortOrder(SortOrderType.asc.text);
            } else {
              listPreferences.setSortOrder(
                  listPreferences.sortOrder == SortOrderType.asc.text
                      ? SortOrderType.desc.text
                      : SortOrderType.asc.text);
            }
            if (onOrderTap != null) {
              onOrderTap!();
            }
          },
        ),
      );
    }
    return texts;
  }
}
