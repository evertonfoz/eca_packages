// import 'package:eca_packages/src/text_and_textformfield/text.dart';
// import 'package:flutter/material.dart';
// import 'package:package_info_plus/package_info_plus.dart';

// class PackageVersionECA extends StatefulWidget {
//   final Color textColor;

//   const PackageVersionECA({
//     Key? key,
//     this.textColor = Colors.white,
//   }) : super(key: key);

//   @override
//   State<PackageVersionECA> createState() => _PackageVersionECAState();
// }

// class _PackageVersionECAState extends State<PackageVersionECA> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: PackageInfo.fromPlatform(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           return TextECA(
//             text: '${snapshot.data.version}/${snapshot.data.buildNumber}',
//             color: widget.textColor,
//             // color: Theme.of(context).textTheme.bodyText1?.color,
//           );
//         } else if (snapshot.hasError) {
//           return TextECA(text: 'Erro');
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
