// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';

// class IndicatorProcessingCircularTextAndGif extends StatelessWidget {
//   final MaterialColor loadingColor;
//   final List<String> texts;
//   final double fontSize;
//   final double textHeight;

//   const IndicatorProcessingCircularTextAndGif({
//     Key? key,
//     required this.loadingColor,
//     required this.texts,
//     this.fontSize = 20,
//     this.textHeight = 30,
//   })  : assert(texts.length > 0),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         GFLoader(
//           type: GFLoaderType.circle,
//           loaderColorOne: loadingColor.shade100,
//           loaderColorTwo: loadingColor.shade300,
//           loaderColorThree: loadingColor.shade600,
//         ),
//         const SizedBox(
//           height: 40,
//         ),
//         SizedBox(
//           height: textHeight,
//           child: DefaultTextStyle(
//             style: TextStyle(
//               fontSize: fontSize,
//               color: loadingColor.shade700,
//             ),
//             child: AnimatedTextKit(
//               animatedTexts: _buildAnimatedTexts(),
//               isRepeatingAnimation: true,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   _buildAnimatedTexts() {
//     return texts.map((e) => FadeAnimatedText(e)).toList();
//   }
// }
