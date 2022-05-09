import 'package:flutter/material.dart';

import 'body.dart';

class FormPagesSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final double horizontalPadding;

//TODO Reavaliar necessiade deste widget
  const FormPagesSingleChildScrollView({
    Key? key,
    required this.child,
    this.horizontalPadding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormPagesBodyPadding(
        horizontal: horizontalPadding,
        vertical: 8,
        child: child,
      ),
    );
  }
}
