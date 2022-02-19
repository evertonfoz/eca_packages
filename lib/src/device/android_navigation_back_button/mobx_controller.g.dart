// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AndroidNavigationBackButtonStore
    on _AndroidNavigationBackButtonStore, Store {
  Computed<bool>? _$backButtonWasPressedComputed;

  @override
  bool get backButtonWasPressed => (_$backButtonWasPressedComputed ??=
          Computed<bool>(() => super.backButtonWasPressed,
              name: '_AndroidNavigationBackButtonStore.backButtonWasPressed'))
      .value;
  Computed<String>? _$actualRouteNameComputed;

  @override
  String get actualRouteName => (_$actualRouteNameComputed ??= Computed<String>(
          () => super.actualRouteName,
          name: '_AndroidNavigationBackButtonStore.actualRouteName'))
      .value;

  final _$_backButtonWasPressedAtom =
      Atom(name: '_AndroidNavigationBackButtonStore._backButtonWasPressed');

  @override
  bool get _backButtonWasPressed {
    _$_backButtonWasPressedAtom.reportRead();
    return super._backButtonWasPressed;
  }

  @override
  set _backButtonWasPressed(bool value) {
    _$_backButtonWasPressedAtom.reportWrite(value, super._backButtonWasPressed,
        () {
      super._backButtonWasPressed = value;
    });
  }

  final _$_actualRouteNameAtom =
      Atom(name: '_AndroidNavigationBackButtonStore._actualRouteName');

  @override
  String? get _actualRouteName {
    _$_actualRouteNameAtom.reportRead();
    return super._actualRouteName;
  }

  @override
  set _actualRouteName(String? value) {
    _$_actualRouteNameAtom.reportWrite(value, super._actualRouteName, () {
      super._actualRouteName = value;
    });
  }

  final _$_AndroidNavigationBackButtonStoreActionController =
      ActionController(name: '_AndroidNavigationBackButtonStore');

  @override
  dynamic registerBackButtonWasPressed({required bool value}) {
    final _$actionInfo =
        _$_AndroidNavigationBackButtonStoreActionController.startAction(
            name:
                '_AndroidNavigationBackButtonStore.registerBackButtonWasPressed');
    try {
      return super.registerBackButtonWasPressed(value: value);
    } finally {
      _$_AndroidNavigationBackButtonStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic registerActualRouteName({required String value}) {
    final _$actionInfo =
        _$_AndroidNavigationBackButtonStoreActionController.startAction(
            name: '_AndroidNavigationBackButtonStore.registerActualRouteName');
    try {
      return super.registerActualRouteName(value: value);
    } finally {
      _$_AndroidNavigationBackButtonStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
backButtonWasPressed: ${backButtonWasPressed},
actualRouteName: ${actualRouteName}
    ''';
  }
}
