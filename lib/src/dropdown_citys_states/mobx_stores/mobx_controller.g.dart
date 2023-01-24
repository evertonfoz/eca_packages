// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'mobx_controller.dart';

// // **************************************************************************
// // StoreGenerator
// // **************************************************************************

// // ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

// mixin _$StateAndCityController on _StateAndCityControllerBase, Store {
//   Computed<ObservableList<StateModel>>? _$statesComputed;

//   @override
//   ObservableList<StateModel> get states => (_$statesComputed ??=
//           Computed<ObservableList<StateModel>>(() => super.states,
//               name: '_StateAndCityControllerBase.states'))
//       .value;
//   Computed<StateModel>? _$stateSelectedComputed;

//   @override
//   StateModel get stateSelected => (_$stateSelectedComputed ??=
//           Computed<StateModel>(() => super.stateSelected,
//               name: '_StateAndCityControllerBase.stateSelected'))
//       .value;
//   Computed<ObservableList<CityModel>>? _$citiesComputed;

//   @override
//   ObservableList<CityModel> get cities => (_$citiesComputed ??=
//           Computed<ObservableList<CityModel>>(() => super.cities,
//               name: '_StateAndCityControllerBase.cities'))
//       .value;
//   Computed<CityModel>? _$citySelectedComputed;

//   @override
//   CityModel get citySelected =>
//       (_$citySelectedComputed ??= Computed<CityModel>(() => super.citySelected,
//               name: '_StateAndCityControllerBase.citySelected'))
//           .value;

//   late final _$_statesAtom =
//       Atom(name: '_StateAndCityControllerBase._states', context: context);

//   @override
//   ObservableList<StateModel>? get _states {
//     _$_statesAtom.reportRead();
//     return super._states;
//   }

//   @override
//   set _states(ObservableList<StateModel>? value) {
//     _$_statesAtom.reportWrite(value, super._states, () {
//       super._states = value;
//     });
//   }

//   late final _$_stateSelectedAtom = Atom(
//       name: '_StateAndCityControllerBase._stateSelected', context: context);

//   @override
//   StateModel? get _stateSelected {
//     _$_stateSelectedAtom.reportRead();
//     return super._stateSelected;
//   }

//   @override
//   set _stateSelected(StateModel? value) {
//     _$_stateSelectedAtom.reportWrite(value, super._stateSelected, () {
//       super._stateSelected = value;
//     });
//   }

//   late final _$_citiesAtom =
//       Atom(name: '_StateAndCityControllerBase._cities', context: context);

//   @override
//   ObservableList<CityModel>? get _cities {
//     _$_citiesAtom.reportRead();
//     return super._cities;
//   }

//   @override
//   set _cities(ObservableList<CityModel>? value) {
//     _$_citiesAtom.reportWrite(value, super._cities, () {
//       super._cities = value;
//     });
//   }

//   late final _$_citySelectedAtom =
//       Atom(name: '_StateAndCityControllerBase._citySelected', context: context);

//   @override
//   CityModel? get _citySelected {
//     _$_citySelectedAtom.reportRead();
//     return super._citySelected;
//   }

//   @override
//   set _citySelected(CityModel? value) {
//     _$_citySelectedAtom.reportWrite(value, super._citySelected, () {
//       super._citySelected = value;
//     });
//   }

//   late final _$getStatesAsyncAction =
//       AsyncAction('_StateAndCityControllerBase.getStates', context: context);

//   @override
//   Future<void> getStates({List<dynamic>? externalData}) {
//     return _$getStatesAsyncAction
//         .run(() => super.getStates(externalData: externalData));
//   }

//   late final _$getCitiesBySelectedStateAsyncAction = AsyncAction(
//       '_StateAndCityControllerBase.getCitiesBySelectedState',
//       context: context);

//   @override
//   Future<void> getCitiesBySelectedState({List<dynamic>? externalData}) {
//     return _$getCitiesBySelectedStateAsyncAction
//         .run(() => super.getCitiesBySelectedState(externalData: externalData));
//   }

//   late final _$_StateAndCityControllerBaseActionController =
//       ActionController(name: '_StateAndCityControllerBase', context: context);

//   @override
//   void registerState(StateModel? stateSelected, {List<dynamic>? externalData}) {
//     final _$actionInfo = _$_StateAndCityControllerBaseActionController
//         .startAction(name: '_StateAndCityControllerBase.registerState');
//     try {
//       return super.registerState(stateSelected, externalData: externalData);
//     } finally {
//       _$_StateAndCityControllerBaseActionController.endAction(_$actionInfo);
//     }
//   }

//   @override
//   void registerCity(CityModel? value) {
//     final _$actionInfo = _$_StateAndCityControllerBaseActionController
//         .startAction(name: '_StateAndCityControllerBase.registerCity');
//     try {
//       return super.registerCity(value);
//     } finally {
//       _$_StateAndCityControllerBaseActionController.endAction(_$actionInfo);
//     }
//   }

//   @override
//   String toString() {
//     return '''
// states: ${states},
// stateSelected: ${stateSelected},
// cities: ${cities},
// citySelected: ${citySelected}
//     ''';
//   }
// }
