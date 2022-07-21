import 'package:mobx/mobx.dart';

part 'main_app_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch --delete-conflicting-outputs

class MainAppStore = _MainAppStore with _$MainAppStore;

abstract class _MainAppStore with Store {
  @observable
  String _actualModule = 'main';

  bool errorWhenTryConnectToServerOccurs = false;

  @computed
  String get actualModule => _actualModule;

//TODO Verificar tela preta ao trocar o launch pela splash
  @action
  registerActualModule(String value) {
    _actualModule = value;
  }
}
