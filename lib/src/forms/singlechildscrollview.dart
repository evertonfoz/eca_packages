import 'package:flutter/material.dart';

import 'body.dart';

class FormPagesSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final double horizontalPadding;

  ///[FormPagesSingleChildScrollView] usado para dar espaçamento horizontal e
  /// vertical, e também atribuir um [SingleChildScrollView] ao form de forma
  /// padronizada.
  const FormPagesSingleChildScrollView({
    Key? key,
    required this.child,
    this.horizontalPadding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const AlwaysScrollableScrollPhysics(),
      child: FormPagesBodyPadding(
        horizontal: horizontalPadding,
        vertical: 8,
        child: child,
      ),
    );
  }
}
