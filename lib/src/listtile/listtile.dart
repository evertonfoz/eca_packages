import 'package:flutter/material.dart';

class ListTileECA extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double? tileHeight;
  final VoidCallback? onTap;
  final bool useCard;

  const ListTileECA({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.tileHeight,
    this.onTap,
    this.useCard = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (useCard) {
      return Card(
        elevation: 10,
        child: _buildListTile(),
      );
    }
    return _buildListTile();
  }

  _buildListTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: tileHeight,
        child: Row(
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
            trailing ?? Container(),
          ],
        ),
      ),
    );
  }
}
