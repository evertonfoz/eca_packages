import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

bool isMatchValidator({required String value, required String otherValue}) {
  if (value != otherValue) return false;
  return true;
}
// #endregion

// ignore: must_be_immutable
class NewPasswordFieldsECA extends StatelessWidget {
  final NewPasswordStore newPasswordStore;
  final GlobalKey<FormState> formKey;
  final String passwordInvalidError;
  final Function(String) invalidPasswordFunction;

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmedFocusNode = FocusNode();

  NewPasswordFieldsECA({
    Key? key,
    required this.newPasswordStore,
    required this.formKey,
    this.passwordInvalidError = kPasswordInvalidError,
    this.invalidPasswordFunction = isAValidPasswordValidatorWithSymbols,
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
            _newPassword(),
            _confirmedPassword(),
          ],
        ),
      ),
    );
  }

  _newPassword() {
    return Observer(builder: (_) {
      return FormFieldGroup(
        obscureText: newPasswordStore.obscureNewPasswordText,
        textTitle: 'Nova senha',
        focusNode: _passwordFocusNode,
        requiredOrientation: true,
        valueToTextController: newPasswordStore.newPassword,
        errorMessages: [
          kNewPasswordNullError,
          passwordInvalidError,
        ],
        validationFunctions: [
          (_password) => isNotEmptyValidator(_password ?? ''),
          (_password) => invalidPasswordFunction(_password ?? ''),
        ],
        registerValueInStoreForm: newPasswordStore.registerNewPassword,
        aditionalSufixIcons: const [
          FontAwesomeIcons.eye,
          FontAwesomeIcons.eyeSlash,
        ],
        onPressAditionalSufixIcon: () =>
            newPasswordStore.registerObscureNewPasswordText(
                value: !newPasswordStore.obscureNewPasswordText),
        errorMaxLines: 2,
        nextFocus: _confirmedFocusNode,
      );
    });
  }

  _confirmedPassword() {
    return Observer(builder: (_) {
      return FormFieldGroup(
        textInputAction: TextInputAction.done,
        textTitle: 'Confimar senha',
        obscureText: newPasswordStore.obscureConfirmedPasswordText,
        focusNode: _confirmedFocusNode,
        requiredOrientation: true,
        valueToTextController: newPasswordStore.confirmedPassword,
        errorMessages: const [
          kConfirmedPasswordNullError,
          kPasswordMatchError,
        ],
        validationFunctions: [
          (_confirmedPassword) => isNotEmptyValidator(_confirmedPassword ?? ''),
          (_confirmedPassword) => isMatchValidator(
              value: _confirmedPassword ?? '',
              otherValue: newPasswordStore.newPassword),
        ],
        registerValueInStoreForm: newPasswordStore.registerConfirmedPassword,
        aditionalSufixIcons: const [
          FontAwesomeIcons.eye,
          FontAwesomeIcons.eyeSlash,
        ],
        onPressAditionalSufixIcon: () =>
            newPasswordStore.registerObscureConfirmedPasswordText(
                value: !newPasswordStore.obscureConfirmedPasswordText),
        errorMaxLines: 2,
      );
    });
  }
}
