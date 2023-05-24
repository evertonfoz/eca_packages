import 'package:mobx/mobx.dart';

part 'mobx_controller.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch --delete-conflicting-outputs

class NewPasswordStore = _NewPasswordStore with _$NewPasswordStore;

abstract class _NewPasswordStore with Store {
  // _NewPasswordStore() {
  //   if (!kReleaseMode) {
  //     registerNewPassword('P@ssw0rd', isAValidPasswordValidatorWithSymbols);
  //     registerConfirmedPassword('P@ssw0rd');
  //   }
  // }
  @observable
  String _newPassword = '';

  @observable
  String _confirmedNewPassword = '';

  @observable
  bool _newPasswordIsValid = false;

  @observable
  bool _confirmedPasswordIsValid = false;

  @observable
  bool _obscureNewPasswordText = true;

  @observable
  bool _obscureConfirmedPasswordText = true;

  @computed
  bool get formIsValid => _newPasswordIsValid && _confirmedPasswordIsValid;

  @computed
  bool get obscureNewPasswordText => _obscureNewPasswordText;

  @computed
  bool get obscureConfirmedPasswordText => _obscureConfirmedPasswordText;

  @computed
  String get newPassword => _newPassword;

  @computed
  String get confirmedPassword => _confirmedNewPassword;

  @action
  registerObscureNewPasswordText({required bool value}) {
    _obscureNewPasswordText = value;
  }

  @action
  registerObscureConfirmedPasswordText({required bool value}) {
    _obscureConfirmedPasswordText = value;
  }

  @action
  registerNewPassword(String value, Function(String) invalidPasswordFunction) {
    _newPassword = value;
    _newPasswordIsValid = invalidPasswordFunction(_newPassword);
  }

  @action
  registerConfirmedPassword(String value) {
    _confirmedNewPassword = value;
    _confirmedPasswordIsValid = _newPassword == _confirmedNewPassword;
  }
}
