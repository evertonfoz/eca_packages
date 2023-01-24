// import 'package:eca_packages/eca_packages.dart';
// import 'package:flutter/material.dart';

// class FormButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final double width;
//   final Color? buttonColor;
//   final Color? foregroundColor;

//   const FormButton({
//     Key? key,
//     required this.onPressed,
//     required this.text,
//     this.width = double.infinity,
//     this.buttonColor,
//     this.foregroundColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           const SizedBox(height: 20),
//           ConstrainedBox(
//             constraints: BoxConstraints.tightFor(width: width, height: 50),
//             child: DefaultRoundedBorderButton(
//               backgroundColor: buttonColor,
//               fontColor: foregroundColor,
//               text: text,
//               onPressed: onPressed,
//               radius: 10,
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
