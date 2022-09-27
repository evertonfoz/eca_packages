// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxController on _MobxControllerBase, Store {
  Computed<StateModel?>? _$stateSelectedComputed;

  @override
  StateModel? get stateSelected => (_$stateSelectedComputed ??=
          Computed<StateModel?>(() => super.stateSelected,
              name: '_MobxControllerBase.stateSelected'))
      .value;

  late final _$statesAtom =
      Atom(name: '_MobxControllerBase.states', context: context);

  @override
  List<StateModel>? get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(List<StateModel>? value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
    });
  }

  late final _$_stateSelectedAtom =
      Atom(name: '_MobxControllerBase._stateSelected', context: context);

  @override
  StateModel? get _stateSelected {
    _$_stateSelectedAtom.reportRead();
    return super._stateSelected;
  }

  @override
  set _stateSelected(StateModel? value) {
    _$_stateSelectedAtom.reportWrite(value, super._stateSelected, () {
      super._stateSelected = value;
    });
  }

  late final _$citiesAtom =
      Atom(name: '_MobxControllerBase.cities', context: context);

  @override
  List<CityModel>? get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(List<CityModel>? value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  late final _$citySelectedAtom =
      Atom(name: '_MobxControllerBase.citySelected', context: context);

  @override
  CityModel? get citySelected {
    _$citySelectedAtom.reportRead();
    return super.citySelected;
  }

  @override
  set citySelected(CityModel? value) {
    _$citySelectedAtom.reportWrite(value, super.citySelected, () {
      super.citySelected = value;
    });
  }

  late final _$findCitiesAsyncAction =
      AsyncAction('_MobxControllerBase.findCities', context: context);

  @override
  Future<void> findCities() {
    return _$findCitiesAsyncAction.run(() => super.findCities());
  }

  late final _$_MobxControllerBaseActionController =
      ActionController(name: '_MobxControllerBase', context: context);

  @override
  void selectState(StateModel stateSelected) {
    final _$actionInfo = _$_MobxControllerBaseActionController.startAction(
        name: '_MobxControllerBase.selectState');
    try {
      return super.selectState(stateSelected);
    } finally {
      _$_MobxControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void findStates() {
    final _$actionInfo = _$_MobxControllerBaseActionController.startAction(
        name: '_MobxControllerBase.findStates');
    try {
      return super.findStates();
    } finally {
      _$_MobxControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCity(CityModel? citySelected) {
    final _$actionInfo = _$_MobxControllerBaseActionController.startAction(
        name: '_MobxControllerBase.selectCity');
    try {
      return super.selectCity(citySelected);
    } finally {
      _$_MobxControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
states: ${states},
cities: ${cities},
citySelected: ${citySelected},
stateSelected: ${stateSelected}
    ''';
  }
}
