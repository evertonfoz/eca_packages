import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/infinity_list/constants/constants.dart';
import 'package:flutter/material.dart';

import 'models/column_row_table_form_model.dart';

class RowTableFormWidget extends StatelessWidget {
  final bool isAHeader;
  final Color backgroundColor;
  final Color textColor;
  final List<ColumnRowTableFormModel> texts;
  final int timesOfHeightSeparator;
  final bool isHovered;

  const RowTableFormWidget({
    Key? key,
    this.isAHeader = false,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black,
    required this.texts,
    this.timesOfHeightSeparator = 1,
    this.isHovered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isAHeader) {
      return _buildHeader();
    }
    return _buildRow();
  }

  _buildRow() {
    return Row(children: _build());
  }

  _buildHeader() {
    return RoundedContainerECA(
      backgroundColor:
          isAHeader ? kHeaderTableFormBackgroundColor : backgroundColor,
      height: (kHeaderTableFormHeightSeparator * timesOfHeightSeparator),
      edgeInsets: const EdgeInsets.all(4),
      child: Row(children: _build()),
    );
  }

  List<Widget> _build() {
    final List<Widget> rowTexts = [];
    for (ColumnRowTableFormModel text in texts) {
      rowTexts.add(
        text.isExpanded ? _expandedCell(text) : _sizedBoxText(text),
      );
      if (isAHeader && text.isThereAfterSeparator) {
        rowTexts.add(
          Container(
            color: kHeaderTableFormColorSeparator,
            width: kHeaderTableFormWidthSeparator,
            height: kHeaderTableFormHeightSeparator * timesOfHeightSeparator,
          ),
        );
      }
    }
    return rowTexts;
  }

  _textToRow(ColumnRowTableFormModel row) {
    return TextECA(
      text: row.text,
      fontSize: isAHeader ? kHeaderTableFormFontSize : kRowTableFormFontSize,
      textAlign: row.textAlign,
      color: _buildColorToTextToRow(),
      fontWeight: _buildFontWeightToTextToRow(),
      textOverflow: TextOverflow.visible,
    );
  }

  _buildColorToTextToRow() {
    if (isAHeader || isHovered) {
      return Colors.white;
    }
    return textColor;
    // isHovered ? Colors.white : textColor,
  }

  _buildFontWeightToTextToRow() {
    if (isAHeader) {
      return FontWeight.normal;
    } else if (isHovered) {
      return FontWeight.bold;
    }
    return FontWeight.normal;

    // isHovered ? FontWeight.bold : FontWeight.normal
  }

  _buildRowContent(ColumnRowTableFormModel row) {
    if (isAHeader) {
      return Padding(
        padding: EdgeInsets.only(left: 8, right: isAHeader ? 8 : 18.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: _textToRow(row)),
            _buildIconToOrderAtHeader(row: row),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 8, right: isAHeader ? 8 : 18.0),
        child: _textToRow(row),
      );
    }

    //  Row(
    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   // mainAxisSize: MainAxisSize.min,
    //   children: [
    //     TextECA(
    //       text: row.title,
    //       fontSize:
    //           isAHeader ? kHeaderTableFormFontSize : kRowTableFormFontSize,
    //       textAlign: row.textAlign,
    //       color: textColor,
    //     ),
    //     isAHeader && row.isTheSelectedOrderBy
    //         ? Icon(
    //             Icons.arrow_drop_down,
    //             color: textColor,
    //           )
    //         : Container(
    //             color: Colors.amber,
    //           ),
    //   ],
    // ),
  }

  _buildIconToOrderAtHeader({required ColumnRowTableFormModel row}) {
    if (row.isOrdered) {
      return InkWell(
        onTap: row.onOrderTap,
        child: Icon(
          row.isAscendentOrder ? Icons.arrow_drop_down : Icons.arrow_drop_up,
          color:
              row.isTheSelectedOrderBy ? textColor : textColor.withOpacity(0.5),
        ),
      );
    }
    return Container();
  }

  _expandedCell(ColumnRowTableFormModel header) {
    return Expanded(child: _buildRowContent(header));
  }

  _sizedBoxText(ColumnRowTableFormModel header) {
    return SizedBox(
      width: header.width,
      child: _buildRowContent(header),
    );
  }
}
