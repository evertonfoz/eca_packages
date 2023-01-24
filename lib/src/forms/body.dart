// import 'package:flutter/material.dart';

// class FormPagesBodyPadding extends StatelessWidget {
//   final Widget child;
//   final double? left;
//   final double? vertical;
//   final double? horizontal;

//   ///[FormPagesBodyPadding] usado para padronizar o espaçamento do body.
//   const FormPagesBodyPadding({
//     Key? key,
//     required this.child,
//     this.left,
//     this.vertical,
//     this.horizontal,
//   })  : assert((left != null && (vertical == null && horizontal == null)) ||
//             (left == null && (vertical != null || horizontal != null))),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (left != null) {
//       return Padding(padding: EdgeInsets.only(left: left!), child: child);
//     } else {
//       return Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: horizontal ?? 0, vertical: vertical ?? 0),
//         child: child,
//       );
//     }
//   }
// }
