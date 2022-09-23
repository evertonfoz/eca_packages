import 'package:mobx/mobx.dart';

part 'main_app_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch --delete-conflicting-outputs

class MainAppStore = _MainAppStore with _$MainAppStore;

abstract class _MainAppStore with Store {
  bool runOnReleaseMode;
  bool isInTest;

  // ignore: unused_element
  _MainAppStore({this.runOnReleaseMode = false, this.isInTest = false});

  @observable
  String _actualModule = 'main';

  bool errorWhenTryConnectToServerOccurs = false;

  @computed
  String get actualModule => _actualModule;

  @action
  registerActualModule(String value) {
    _actualModule = value;
  }
}
