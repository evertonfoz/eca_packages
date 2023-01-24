// import 'package:flutter/material.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';

// // ignore: must_be_immutable
// class IndicatorStepProgress extends StatelessWidget {
//   final double width;
//   final int totalOfSteps;
//   final int currentStep;
//   final Color selectedColor;
//   late Color? _unSelectedColor;

//   IndicatorStepProgress({
//     Key? key,
//     this.width = 0.8,
//     required this.totalOfSteps,
//     required this.currentStep,
//     this.selectedColor = Colors.greenAccent,
//     unSelectedColor,
//   })  : assert(width >= 0 && width <= 1),
//         super(key: key) {
//     _unSelectedColor = unSelectedColor ?? Colors.grey.shade200;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * .80,
//       child: Padding(
//         padding: const EdgeInsets.only(right: 12.0),
//         child: StepProgressIndicator(
//           totalSteps: totalOfSteps,
//           currentStep: currentStep,
//           selectedColor: selectedColor,
//           unselectedColor: _unSelectedColor!,
//           roundedEdges: const Radius.circular(8),
//           size: 12,
//           padding: 0,
//         ),
//       ),
//     );
//   }
// }
