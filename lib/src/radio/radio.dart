import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

class RadioECA<T> extends StatelessWidget {
  final Function(Object?) onChanged;
  final String text;
  final dynamic value;
  final dynamic groupValue;
  final bool enabled;
  final double scale;
  final double fontSize;
  final Color? activeColor;

  const RadioECA({
    Key? key,
    required this.onChanged,
    required this.text,
    required this.value,
    required this.groupValue,
    this.enabled = true,
    this.scale = 1.0,
    this.fontSize = 20,
    this.activeColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Transform.scale(
                scale: scale,
                child: Radio<T>(
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: activeColor ??
                      Theme.of(context).textTheme.headline1!.color,
                  toggleable: false,
                  value: value,
                  onChanged: !enabled ? null : (value) => onChanged(value),
                  groupValue: groupValue,
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => onChanged(value),
                  child: TextECA(
                    text: text,
                    fontSize: fontSize,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
