// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImagePickerStore on _ImagePickerStore, Store {
  Computed<String>? _$newAvatarPathComputed;

  @override
  String get newAvatarPath =>
      (_$newAvatarPathComputed ??= Computed<String>(() => super.newAvatarPath,
              name: '_ImagePickerStore.newAvatarPath'))
          .value;

  late final _$_newAvatarPathAtom =
      Atom(name: '_ImagePickerStore._newAvatarPath', context: context);

  @override
  String? get _newAvatarPath {
    _$_newAvatarPathAtom.reportRead();
    return super._newAvatarPath;
  }

  @override
  set _newAvatarPath(String? value) {
    _$_newAvatarPathAtom.reportWrite(value, super._newAvatarPath, () {
      super._newAvatarPath = value;
    });
  }

  late final _$_ImagePickerStoreActionController =
      ActionController(name: '_ImagePickerStore', context: context);

  @override
  dynamic registerNewAvatarPath(String value) {
    final _$actionInfo = _$_ImagePickerStoreActionController.startAction(
        name: '_ImagePickerStore.registerNewAvatarPath');
    try {
      return super.registerNewAvatarPath(value);
    } finally {
      _$_ImagePickerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newAvatarPath: ${newAvatarPath}
    ''';
  }
}
