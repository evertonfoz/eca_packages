// import 'package:flutter/material.dart';

// class AppBarECA extends StatelessWidget {
//   final List<Widget> actions;
//   final double elevation;
//   final Widget? leading;
//   final double? leadingWidth;
//   final Widget? title;
//   final Color? backgroundColor;
//   final bool? automaticallyImplyLeading;
//   final bool? centerTitle;
//   final double topPadding;

//   const AppBarECA({
//     Key? key,
//     this.actions = const [],
//     this.elevation = 0,
//     this.leading,
//     this.leadingWidth,
//     this.backgroundColor,
//     this.automaticallyImplyLeading,
//     this.centerTitle,
//     this.title,
//     this.topPadding = 0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: topPadding),
//       child: AppBar(
//         automaticallyImplyLeading: automaticallyImplyLeading ?? false,
//         centerTitle: centerTitle ?? false,
//         backgroundColor: backgroundColor,
//         leadingWidth: leadingWidth ?? 50,
//         elevation: elevation,
//         actions: actions,
//         leading: leading,
//         title: title,
//       ),
//     );
//   }
// }
