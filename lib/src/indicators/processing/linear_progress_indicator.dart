import 'package:flutter/material.dart';

class LinearProgressIndicatorECA extends StatefulWidget {
  const LinearProgressIndicatorECA({Key? key}) : super(key: key);

  @override
  State<LinearProgressIndicatorECA> createState() =>
      _LinearProgressIndicatorECAState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LinearProgressIndicatorECAState extends State<LinearProgressIndicatorECA>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Linear progress indicator with a fixed color',
              style: TextStyle(fontSize: 20),
            ),
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}
