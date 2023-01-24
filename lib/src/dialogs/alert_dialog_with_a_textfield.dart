// import 'package:eca_packages/eca_packages.dart';
// import 'package:flutter/material.dart';

// class AlertDialogWithATextFieldWidget extends StatelessWidget {
//   final Widget title;
//   final Widget content;
//   final String okButtonText;
//   final String cancelButtonText;
//   final MaterialColor buttonsColor;
//   final Color backgroundColor;
//   final Color textButtonColor;
//   final Color hoverColor;
//   final Function? onOkButtonPressed;

//   const AlertDialogWithATextFieldWidget({
//     Key? key,
//     required this.title,
//     required this.content,
//     this.okButtonText = 'OK',
//     this.cancelButtonText = 'Cancelar',
//     required this.buttonsColor,
//     this.backgroundColor = Colors.white,
//     this.textButtonColor = Colors.white,
//     this.hoverColor = Colors.blue,
//     this.onOkButtonPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: AlertDialog(
//           backgroundColor: backgroundColor,
//           // contentPadding: EdgeInsets.zero,
//           // titlePadding: EdgeInsets.zero,
//           title: title,
//           content: content,
//           actions: <Widget>[
//             DefaultRoundedBorderButton(
//               fontColor: textButtonColor,
//               fontWeight: FontWeight.normal,
//               radius: 10,
//               onPressed: () => Navigator.of(context).pop(),
//               text: cancelButtonText,
//               textBottomPadding: 6,
//               height: 42,
//               backgroundColor: buttonsColor.shade400,
//               hoveredColor: hoverColor,
//             ),
//             DefaultRoundedBorderButton(
//               fontColor: textButtonColor,
//               fontWeight: FontWeight.normal,
//               radius: 10,
//               onPressed: () async {
//                 bool result = true;
//                 if (onOkButtonPressed != null) {
//                   result = await onOkButtonPressed!();
//                 }
//                 if (result) {
//                   Navigator.of(context).pop();
//                 }
//               },
//               text: okButtonText,
//               textBottomPadding: 6,
//               height: 42,
//               backgroundColor: buttonsColor.shade900,
//               hoveredColor: hoverColor,
//             )
//           ]),
//     );
//   }
// }
