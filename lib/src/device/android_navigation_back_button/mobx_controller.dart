// import 'package:mobx/mobx.dart';

// part 'mobx_controller.g.dart';

// /// flutter packages pub run build_runner build
// /// flutter packages pub run build_runner build --delete-conflicting-outputs
// /// flutter packages pub run build_runner watch --delete-conflicting-outputs

// class AndroidNavigationBackButtonStore = _AndroidNavigationBackButtonStore
//     with _$AndroidNavigationBackButtonStore;

// abstract class _AndroidNavigationBackButtonStore with Store {
//   @observable
//   bool _backButtonWasPressed = false;

//   @observable
//   String? _actualRouteName;

//   @computed
//   bool get backButtonWasPressed => _backButtonWasPressed;

//   @computed
//   String get actualRouteName => _actualRouteName ?? '';

//   @action
//   registerBackButtonWasPressed({required bool value}) {
//     _backButtonWasPressed = value;
//   }

//   @action
//   registerActualRouteName({required String value}) {
//     _actualRouteName = value;
//   }
// }
