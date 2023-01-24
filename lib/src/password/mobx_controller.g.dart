// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewPasswordStore on _NewPasswordStore, Store {
  Computed<bool>? _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid,
              name: '_NewPasswordStore.formIsValid'))
          .value;
  Computed<bool>? _$obscureNewPasswordTextComputed;

  @override
  bool get obscureNewPasswordText => (_$obscureNewPasswordTextComputed ??=
          Computed<bool>(() => super.obscureNewPasswordText,
              name: '_NewPasswordStore.obscureNewPasswordText'))
      .value;
  Computed<bool>? _$obscureConfirmedPasswordTextComputed;

  @override
  bool get obscureConfirmedPasswordText =>
      (_$obscureConfirmedPasswordTextComputed ??= Computed<bool>(
              () => super.obscureConfirmedPasswordText,
              name: '_NewPasswordStore.obscureConfirmedPasswordText'))
          .value;
  Computed<String>? _$newPasswordComputed;

  @override
  String get newPassword =>
      (_$newPasswordComputed ??= Computed<String>(() => super.newPassword,
              name: '_NewPasswordStore.newPassword'))
          .value;
  Computed<String>? _$confirmedPasswordComputed;

  @override
  String get confirmedPassword => (_$confirmedPasswordComputed ??=
          Computed<String>(() => super.confirmedPassword,
              name: '_NewPasswordStore.confirmedPassword'))
      .value;

  late final _$_newPasswordAtom =
      Atom(name: '_NewPasswordStore._newPassword', context: context);

  @override
  String get _newPassword {
    _$_newPasswordAtom.reportRead();
    return super._newPassword;
  }

  @override
  set _newPassword(String value) {
    _$_newPasswordAtom.reportWrite(value, super._newPassword, () {
      super._newPassword = value;
    });
  }

  late final _$_confirmedNewPasswordAtom =
      Atom(name: '_NewPasswordStore._confirmedNewPassword', context: context);

  @override
  String get _confirmedNewPassword {
    _$_confirmedNewPasswordAtom.reportRead();
    return super._confirmedNewPassword;
  }

  @override
  set _confirmedNewPassword(String value) {
    _$_confirmedNewPasswordAtom.reportWrite(value, super._confirmedNewPassword,
        () {
      super._confirmedNewPassword = value;
    });
  }

  late final _$_newPasswordIsValidAtom =
      Atom(name: '_NewPasswordStore._newPasswordIsValid', context: context);

  @override
  bool get _newPasswordIsValid {
    _$_newPasswordIsValidAtom.reportRead();
    return super._newPasswordIsValid;
  }

  @override
  set _newPasswordIsValid(bool value) {
    _$_newPasswordIsValidAtom.reportWrite(value, super._newPasswordIsValid, () {
      super._newPasswordIsValid = value;
    });
  }

  late final _$_confirmedPasswordIsValidAtom = Atom(
      name: '_NewPasswordStore._confirmedPasswordIsValid', context: context);

  @override
  bool get _confirmedPasswordIsValid {
    _$_confirmedPasswordIsValidAtom.reportRead();
    return super._confirmedPasswordIsValid;
  }

  @override
  set _confirmedPasswordIsValid(bool value) {
    _$_confirmedPasswordIsValidAtom
        .reportWrite(value, super._confirmedPasswordIsValid, () {
      super._confirmedPasswordIsValid = value;
    });
  }

  late final _$_obscureNewPasswordTextAtom =
      Atom(name: '_NewPasswordStore._obscureNewPasswordText', context: context);

  @override
  bool get _obscureNewPasswordText {
    _$_obscureNewPasswordTextAtom.reportRead();
    return super._obscureNewPasswordText;
  }

  @override
  set _obscureNewPasswordText(bool value) {
    _$_obscureNewPasswordTextAtom
        .reportWrite(value, super._obscureNewPasswordText, () {
      super._obscureNewPasswordText = value;
    });
  }

  late final _$_obscureConfirmedPasswordTextAtom = Atom(
      name: '_NewPasswordStore._obscureConfirmedPasswordText',
      context: context);

  @override
  bool get _obscureConfirmedPasswordText {
    _$_obscureConfirmedPasswordTextAtom.reportRead();
    return super._obscureConfirmedPasswordText;
  }

  @override
  set _obscureConfirmedPasswordText(bool value) {
    _$_obscureConfirmedPasswordTextAtom
        .reportWrite(value, super._obscureConfirmedPasswordText, () {
      super._obscureConfirmedPasswordText = value;
    });
  }

  late final _$_NewPasswordStoreActionController =
      ActionController(name: '_NewPasswordStore', context: context);

  @override
  dynamic registerObscureNewPasswordText({required bool value}) {
    final _$actionInfo = _$_NewPasswordStoreActionController.startAction(
        name: '_NewPasswordStore.registerObscureNewPasswordText');
    try {
      return super.registerObscureNewPasswordText(value: value);
    } finally {
      _$_NewPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registerObscureConfirmedPasswordText({required bool value}) {
    final _$actionInfo = _$_NewPasswordStoreActionController.startAction(
        name: '_NewPasswordStore.registerObscureConfirmedPasswordText');
    try {
      return super.registerObscureConfirmedPasswordText(value: value);
    } finally {
      _$_NewPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registerNewPassword(
      String value, dynamic Function(String) invalidPasswordFunction) {
    final _$actionInfo = _$_NewPasswordStoreActionController.startAction(
        name: '_NewPasswordStore.registerNewPassword');
    try {
      return super.registerNewPassword(value, invalidPasswordFunction);
    } finally {
      _$_NewPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registerConfirmedPassword(String value) {
    final _$actionInfo = _$_NewPasswordStoreActionController.startAction(
        name: '_NewPasswordStore.registerConfirmedPassword');
    try {
      return super.registerConfirmedPassword(value);
    } finally {
      _$_NewPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formIsValid: ${formIsValid},
obscureNewPasswordText: ${obscureNewPasswordText},
obscureConfirmedPasswordText: ${obscureConfirmedPasswordText},
newPassword: ${newPassword},
confirmedPassword: ${confirmedPassword}
    ''';
  }
}
