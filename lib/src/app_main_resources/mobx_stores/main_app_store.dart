import 'package:eca_packages/eca_packages.dart';
import 'package:ed_screen_recorder_v3/ed_screen_recorder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'main_app_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch --delete-conflicting-outputs

class MainAppStore = _MainAppStore with _$MainAppStore;

abstract class _MainAppStore with Store {
  bool runOnReleaseMode;
  bool isInTest;
  EdScreenRecorder? screenRecorder;

  // ignore: unused_element
  _MainAppStore({this.runOnReleaseMode = false, this.isInTest = false});

  @observable
  String _actualModule = 'main';

  bool errorWhenTryConnectToServerOccurs = false;

  @observable
  bool _haveConnection = true;

  @computed
  String get actualModule => _actualModule;

  @computed
  bool get haveConnection => _haveConnection;

  @action
  registerActualModule(String value) {
    _actualModule = value;
  }

  @action
  registerHaveConnection(bool value) {
    _haveConnection = value;
    Modular.get<InProcessingStore>().registerIsInProcessing(!value);
  }
}
