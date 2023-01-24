// import 'package:eca_packages/eca_packages.dart';
// import 'package:flutter/material.dart';

// class CheckBoxECA extends StatefulWidget {
//   final Function(bool)? onChanged;
//   final String? text;
//   final Widget? widget;
//   final Color? fillColor;
//   final double scale;
//   final double size;
//   final bool? checked;
//   final double textFontSize;
//   final FontWeight fontWeight;
//   final bool isObservable;
//   final double spaceBetweenCheckAndText;
//   final Widget? afterTextWidget;

//   ///[CheckBoxECA] widget para adicionar um checkbox personalizado permitindo
//   ///adicionar um widget ao lado dele, como por exemplo, um texto.
//   const CheckBoxECA({
//     Key? key,
//     required this.onChanged,
//     this.text,
//     this.fillColor,
//     this.scale = 1,
//     this.size = 24,
//     this.checked,
//     this.widget,
//     this.textFontSize = 14,
//     this.fontWeight = FontWeight.normal,
//     this.isObservable = false,
//     this.spaceBetweenCheckAndText = 5,
//     this.afterTextWidget,
//   })  : assert((text != null && widget == null) ||
//             (text == null && widget != null)),
//         super(key: key);

//   @override
//   State<CheckBoxECA> createState() => _CheckBoxECAState();
// }

// class _CheckBoxECAState extends State<CheckBoxECA> {
//   late bool _checked;

//   @override
//   void initState() {
//     super.initState();
//     _checked = widget.checked ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.isObservable) {
//       _checked = widget.checked ?? false;
//     }
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Expanded(
//           flex: 1,
//           child: Transform.scale(
//             scale: widget.scale,
//             child: SizedBox(
//               width: widget.size,
//               height: widget.size,
//               child: Checkbox(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 fillColor: MaterialStateProperty.all<Color>(widget.fillColor ??
//                     Theme.of(context).iconTheme.color ??
//                     Colors.black),
//                 value: _checked,
//                 onChanged: (value) {
//                   setState(() {
//                     _checked = !_checked;
//                   });

//                   if (widget.onChanged != null) {
//                     widget.onChanged!(value!);
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: widget.spaceBetweenCheckAndText),
//         Expanded(
//           flex: 8,
//           child: _buildText(),
//         ),
//         // SizedBox(width: widget.spaceBetweenCheckAndText),
//         widget.afterTextWidget ?? Container(),
//       ],
//     );
//   }

//   _buildText() {
//     if (widget.text != null) {
//       return InkWell(
//         onTap: () {
//           setState(() {
//             _checked = !_checked;
//           });

//           if (widget.onChanged != null) {
//             widget.onChanged!(_checked);
//           }
//         },
//         child: TextECA(
//           text: widget.text!,
//           fontSize: widget.textFontSize,
//           textAlign: TextAlign.start,
//           fontWeight: widget.fontWeight,
//         ),
//       );
//     }
//     return widget.widget;
//   }
// }
