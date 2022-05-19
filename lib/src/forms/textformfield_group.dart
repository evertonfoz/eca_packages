import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldGroup extends StatelessWidget {
  final Function(String?)? onSaved;
  final String textTitle;
  final FontWeight fontWeight;
  final bool requiredOrientation;
  // final bool? enableControllers;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String valueToTextController;
  final List<String> errorMessages;
  final List<Function(String?)> validationFunctions;
  final Function(String)? registerValueInStoreForm;
  final bool obscureText;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final List<IconData>? aditionalSufixIcons;
  final VoidCallback? onPressAditionalSufixIcon;
  final List<TextInputFormatter>? textInputFormatters;
  final int errorMaxLines;
  final int? maxLines;
  final String? prefixText;
  final TextEditingController? textEditingController;
  final Function(bool)? registerStatusInStoreForm;
  final TextAlign? textFieldTextAlign;
  final bool enabled;

  /// [FormFieldGroup] tem como objetivo a criação do campo para inserção de dados
  /// nome de titulo que aparecerá,
  /// validação do que ocorre dentro do textfild,
  /// e mensagens de erro.
  /// Cores e outros tipos de formatação vem por padrão

  const FormFieldGroup({
    Key? key,
    required this.textTitle,
    this.fontWeight = FontWeight.w600,
    this.requiredOrientation = false,
    // this.enableControllers = true,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    required this.valueToTextController,
    this.errorMessages = const [],
    this.validationFunctions = const [],
    required this.registerValueInStoreForm,
    this.obscureText = false,
    this.focusNode,
    this.nextFocus,
    this.aditionalSufixIcons,
    this.onPressAditionalSufixIcon,
    this.errorMaxLines = 1,
    this.textInputFormatters,
    this.maxLines,
    this.prefixText,
    this.textEditingController,
    this.onSaved,
    this.registerStatusInStoreForm,
    this.textFieldTextAlign,
    this.enabled = true,
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
          enabled: enabled,
          textFieldTextAlign: textFieldTextAlign,
          textEditingController: textEditingController,
          prefixText: prefixText,
          maxLines: maxLines ?? 1,
          textInputFormatters: textInputFormatters,
          focusNode: focusNode,
          obscureText: obscureText,
          textInputAction: textInputAction,
          textInputType: textInputType,
          valueToTextController: valueToTextController,
          errorMessages: errorMessages,
          validationFunctions: validationFunctions,
          registerValueInStoreForm: registerValueInStoreForm,
          onPressAditionalSufixIcon: onPressAditionalSufixIcon,
          aditionalSufixIcons: aditionalSufixIcons,
          errorMaxLines: errorMaxLines,
          nextFocus: nextFocus,
          onSaved: onSaved,
          registerStatusInStoreForm: registerStatusInStoreForm,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
