// import 'dart:async';

// import 'package:flutter/material.dart';

// class Debounce {
//   final VoidCallback function;
//   final Duration duration;
//   Timer? timer;
//   int? lastCompletionTime;

//   Debounce({required this.duration, required this.function});

//   void schedule() {
//     var now = DateTime.now().millisecondsSinceEpoch;

//     if (timer == null || (timer != null && !timer!.isActive)) {
//       lastCompletionTime = now + duration.inMilliseconds;
//       timer = Timer(duration, function);
//     } else {
//       timer?.cancel(); // doesn't throw exception if _timer is not active
//       int wait = lastCompletionTime! -
//           now; // this uses last wait time, so we need to wait only for calculated wait time
//       lastCompletionTime = now + wait;
//       timer = Timer(Duration(milliseconds: wait), function);
//     }
//   }
// }
