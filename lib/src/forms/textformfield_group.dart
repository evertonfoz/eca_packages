import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

class FormFieldGroup extends StatelessWidget {
  final String textTitle;
  final FontWeight fontWeight;
  final bool requiredOrientation;
  final bool enableControllers;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String valueToTextController;
  final List<String> errorMessages;
  final List<Function(String?)> validationFunctions;
  final Function(String)? registerValueInStoreForm;
  final bool obscureText;

  const FormFieldGroup({
    Key? key,
    required this.textTitle,
    this.fontWeight = FontWeight.w600,
    this.requiredOrientation = false,
    this.enableControllers = true,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    required this.valueToTextController,
    this.errorMessages = const [],
    this.validationFunctions = const [],
    required this.registerValueInStoreForm,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextECA(
          text: textTitle,
          fontWeight: fontWeight,
          requiredOrientation: requiredOrientation,
        ),
        const SizedBox(height: 10),
        TextFormFieldECA(
          obscureText: obscureText,
          enabled: enableControllers,
          textInputAction: textInputAction,
          textInputType: textInputType,
          valueToTextController: valueToTextController,
          errorMessages: errorMessages,
          validationFunctions: validationFunctions,
          registerValueInStoreForm: registerValueInStoreForm,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
