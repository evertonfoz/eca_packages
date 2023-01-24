import 'package:flutter/material.dart';

class ListTileECA extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double? tileHeight;
  final VoidCallback? onTap;
  final bool useCard;
  final bool emphasisColor;
  final double verticalPadding;
  final Widget? tileBottom;

  const ListTileECA({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.tileHeight,
    this.onTap,
    this.useCard = true,
    this.emphasisColor = false,
    this.verticalPadding = 8,
    this.tileBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (useCard) {
      return Card(
        // clipBehavior: Clip.hardEdge,
        color: emphasisColor ? Colors.white : Colors.grey.shade200,
        elevation: 10,
        borderOnForeground: true,
        child: _buildListTile(),
      );
    }
    return _buildListTile();
  }

  _buildListTile() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: SizedBox(
        height: tileHeight,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leading ?? Container(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title ?? Container(),
                      subtitle ?? Container(),
                    ],
                  ),
                ),
                SizedBox(height: tileHeight, child: trailing ?? Container()),
              ],
            ),
            tileBottom ?? Container(),
          ],
        ),
      ),
    );
  }
}
