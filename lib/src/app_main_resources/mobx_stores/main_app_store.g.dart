// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainAppStore on _MainAppStore, Store {
  Computed<String>? _$actualModuleComputed;

  @override
  String get actualModule =>
      (_$actualModuleComputed ??= Computed<String>(() => super.actualModule,
              name: '_MainAppStore.actualModule'))
          .value;
  Computed<bool>? _$haveConnectionComputed;

  @override
  bool get haveConnection =>
      (_$haveConnectionComputed ??= Computed<bool>(() => super.haveConnection,
              name: '_MainAppStore.haveConnection'))
          .value;

  late final _$_actualModuleAtom =
      Atom(name: '_MainAppStore._actualModule', context: context);

  @override
  String get _actualModule {
    _$_actualModuleAtom.reportRead();
    return super._actualModule;
  }

  @override
  set _actualModule(String value) {
    _$_actualModuleAtom.reportWrite(value, super._actualModule, () {
      super._actualModule = value;
    });
  }

  late final _$_haveConnectionAtom =
      Atom(name: '_MainAppStore._haveConnection', context: context);

  @override
  bool get _haveConnection {
    _$_haveConnectionAtom.reportRead();
    return super._haveConnection;
  }

  @override
  set _haveConnection(bool value) {
    _$_haveConnectionAtom.reportWrite(value, super._haveConnection, () {
      super._haveConnection = value;
    });
  }

  late final _$_MainAppStoreActionController =
      ActionController(name: '_MainAppStore', context: context);

  @override
  dynamic registerActualModule(String value) {
    final _$actionInfo = _$_MainAppStoreActionController.startAction(
        name: '_MainAppStore.registerActualModule');
    try {
      return super.registerActualModule(value);
    } finally {
      _$_MainAppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registerHaveConnection(bool value) {
    final _$actionInfo = _$_MainAppStoreActionController.startAction(
        name: '_MainAppStore.registerHaveConnection');
    try {
      return super.registerHaveConnection(value);
    } finally {
      _$_MainAppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualModule: ${actualModule},
haveConnection: ${haveConnection}
    ''';
  }
}
