// import 'package:flutter/material.dart';

// class DefaultTextButton extends StatelessWidget {
//   final String text;
//   final Color? foregroundColor;
//   final VoidCallback onPressed;
//   final VoidCallback? onLongPress;
//   final Color? backgroundColor;
//   final Color? primaryColor;
//   final double? fontSize;

//   const DefaultTextButton({
//     Key? key,
//     required this.text,
//     this.foregroundColor,
//     this.backgroundColor,
//     this.primaryColor,
//     required this.onPressed,
//     this.fontSize,
//     this.onLongPress,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: _buildTextButtonStyleFrom(),
//       onPressed: onPressed,
//       onLongPress: onLongPress,
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: fontSize ??
//               28 *
//                   (MediaQuery.of(context).size.width /
//                       MediaQuery.of(context).size.height),
//           // color: foregroundColor,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   _buildTextButtonStyleFrom() {
//     return TextButton.styleFrom(
//       foregroundColor: foregroundColor,
//       backgroundColor: backgroundColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     );
//   }
// }
