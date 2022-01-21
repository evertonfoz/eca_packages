import 'package:flutter/material.dart';

class ListTileECA extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double? tileHeight;
  final VoidCallback? onTap;

  const ListTileECA({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.tileHeight, //: 50,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
