// import 'package:eca_packages/eca_packages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// class AppBarWithBackLeading extends StatelessWidget {
//   final Color backgroundColor;
//   final Function()? onTapBack;
//   final Color iconBackColor;
//   final Color textTitleColor;
//   final String title;

//   const AppBarWithBackLeading({
//     super.key,
//     required this.backgroundColor,
//     this.onTapBack,
//     required this.iconBackColor,
//     required this.textTitleColor,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBarECA(
//       backgroundColor: backgroundColor,
//       elevation: 5,
//       leading: InkWell(
//         onTap: onTapBack,
//         child: AppBarContainer(
//           width: 70,
//           child: Align(
//             alignment: Alignment.center,
//             child: IconECA(
//               icon: kIconArrowBack,
//               color: iconBackColor,
//             ),
//           ),
//         ),
//       ),
//       title: Observer(builder: (context) {
//         return ShimmerECA(
//           isInProcessing: Modular.get<InProcessingStore>().isInProcessing,
//           child: FittedBox(
//             child: TextECA(
//               text: title,
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: textTitleColor,
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
