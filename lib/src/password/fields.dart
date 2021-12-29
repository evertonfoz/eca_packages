import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../eca_packages.dart';

// #region Constants
const String kNewPasswordNullError = 'Por favor, informe o seu nome';
const String kConfirmedNewPasswordlNullError = 'Por favor, informe o seu email';
const String kPasswordInvalidError =
    'Mínimo 8 caracteres, sendo necessário: 1 letra maiuscula, 1 minúscula, 1 número e 1 símbolo';
const String kConfirmedPasswordNullError =
    'Por favor, informe a confirmação da senha';
const String kPasswordMatchError = 'Confirmação deve ser igual a nova senha';

// #endregion

// #region Validation functions
bool isNotEmptyValidator(String value) {
  return value.isNotEmpty;
}

bool isAValidPasswordValidatorWithSymbols(String password) {
  if (password.length < 8) return false;
  if (!password.contains(RegExp(r"[a-z]"))) return false;
  if (!password.contains(RegExp(r"[A-Z]"))) return false;
  if (!password.contains(RegExp(r"[0-9]"))) return false;
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
  return true;
}

bool isAValidPasswordValidatorOnlyLettersAndNumbers(String password) {
  if (password.length < 6) return false;
  if (!password.contains(RegExp(r"[a-z]"))) return false;
  if (!password.contains(RegExp(r"[0-9]"))) return false;
  return true;
}

bool isMatchValidator({required String value, required String otherValue}) {
  if (value != otherValue) return false;
  return true;
}
// #endregion

// ignore: must_be_immutable
class NewPasswordFields extends StatelessWidget {
  final NewPasswordStore newPasswordStore;
  final GlobalKey<FormState> formKey;
  // final FocusNode _passwordFocusNode = FocusNode();
  // final FocusNode _confirmedFocusNode = FocusNode();

  const NewPasswordFields({
    Key? key,
    required this.newPasswordStore,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (_) {
              return FormFieldGroup(
                textTitle: 'Nova senha',
                requiredOrientation: true,
                valueToTextController: newPasswordStore.newPassword,
                errorMessages: const [
                  kNewPasswordNullError,
                  kPasswordInvalidError,
                ],
                validationFunctions: [
                  (_password) => isNotEmptyValidator(_password ?? ''),
                  (_password) =>
                      isAValidPasswordValidatorWithSymbols(_password ?? ''),
                ],
                registerValueInStoreForm: newPasswordStore.registerNewPassword,
              );
            }),
            // Observer(
            //   builder: (_) => TextFormFieldDC(
            //     focusNode: _passwordFocusNode,
            //     obscureText: newPasswordStore.obscureNewPasswordText,
            //     onPressAditionalSufixIcon: () =>
            //         newPasswordStore.registerObscureNewPasswordText(
            //             value: !newPasswordStore.obscureNewPasswordText),
            //     textInputAction: TextInputAction.next,
            //     aditionalSufixIcons: [
            //       FontAwesomeIcons.eye,
            //       FontAwesomeIcons.eyeSlash,
            //     ],
            //     errorMessages: [
            //       kPasswordNullError,
            //       kPasswordInvalidError,
            //     ],
            //     validationFunctions: [
            //       (_password) =>
            //           validators.isNotEmptyValidator(_password ?? ''),
            //       (_password) =>
            //           validators.isAValidPasswordValidator(_password ?? ''),
            //     ],
            //     onSaved: null,
            //     registerStatusInStoreForm:
            //         newPasswordStore.registerNewPasswordStatus,
            //     registerValueInStoreForm: newPasswordStore.registerNewPassword,
            //     errorMaxLines: 2,
            //     nextFocus: _confirmedFocusNode,
            //   ),
            // ),
            // SizedBox(height: 20),
            // TextDC(
            //   text: 'Confirmar senha',
            //   fontSize: 14,
            //   fontWeight: FontWeight.w600,
            // ),
            // SizedBox(height: 10),
            // Observer(
            //   builder: (_) => TextFormFieldDC(
            //     focusNode: _confirmedFocusNode,
            //     errorMaxLines: 2,
            //     obscureText: newPasswordStore.obscureConfirmedPasswordText,
            //     onPressAditionalSufixIcon: () =>
            //         newPasswordStore.registerObscureConfirmedPasswordText(
            //             value: !newPasswordStore.obscureConfirmedPasswordText),
            //     aditionalSufixIcons: [
            //       FontAwesomeIcons.eye,
            //       FontAwesomeIcons.eyeSlash,
            //     ],
            //     errorMessages: [
            //       kConfirmedPasswordNullError,
            //       kPasswordMatchError,
            //     ],
            //     validationFunctions: [
            //       (_confirmedPassword) =>
            //           validators.isNotEmptyValidator(_confirmedPassword ?? ''),
            //       (_confirmedPassword) => validators.isMatchValidator(
            //           value: _confirmedPassword ?? '',
            //           otherValue: newPasswordStore.newPassword),
            //     ],
            //     onSaved: null, // (newValue) => _password = newValue,
            //     registerStatusInStoreForm:
            //         newPasswordStore.registerConfirmedPasswordStatus,
            //     registerValueInStoreForm:
            //         newPasswordStore.registerConfirmedPassword,
            //   ),
            // ),
            // SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
