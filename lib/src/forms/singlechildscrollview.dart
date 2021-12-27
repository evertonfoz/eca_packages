import 'package:flutter/material.dart';

import 'body.dart';

class FormPagesSingleChildScrollView extends StatelessWidget {
  final Widget child;

  const FormPagesSingleChildScrollView({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormPagesBodyPadding(
        horizontal: 16,
        vertical: 8,
        child: child,
      ),
    );
  }
}
