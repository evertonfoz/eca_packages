// import 'package:eca_packages/src/dropdown_citys_states/controllers/cities.dart';
// import 'package:eca_packages/src/dropdown_citys_states/controllers/states_get_all.dart';
// import 'package:eca_packages/src/dropdown_citys_states/data/models/cities.dart';
// import 'package:eca_packages/src/dropdown_citys_states/data/models/states.dart';
// import 'package:mobx/mobx.dart';

// part 'mobx_controller.g.dart';

// /// flutter packages pub run build_runner build
// /// flutter packages pub run build_runner build --delete-conflicting-outputs
// /// flutter packages pub run build_runner watch --delete-conflicting-outputs

// class StateAndCityController = _StateAndCityControllerBase
//     with _$StateAndCityController;

// abstract class _StateAndCityControllerBase with Store {
//   @observable
//   ObservableList<StateModel>? _states;

//   @computed
//   ObservableList<StateModel> get states => _states ?? ObservableList();

//   @observable
//   StateModel? _stateSelected;

//   @computed
//   StateModel get stateSelected =>
//       _stateSelected ?? const StateModel(id: 'XX', name: 'Selecione um estado');

//   @action
//   void registerState(StateModel? stateSelected, {List<dynamic>? externalData}) {
//     _stateSelected = stateSelected;
//     getCitiesBySelectedState(externalData: externalData);
//   }

//   @observable
//   ObservableList<CityModel>? _cities;

//   @observable
//   CityModel? _citySelected;

//   @computed
//   ObservableList<CityModel> get cities => _cities ?? ObservableList();

//   @computed
//   CityModel get citySelected =>
//       _citySelected ??
//       const CityModel(id: -1, name: 'Escolha uma cidade', state: 'XX');

//   @action
//   void registerCity(CityModel? value) {
//     _citySelected = value;
//   }

//   @action
//   Future<void> getStates({List<dynamic>? externalData}) async {
//     var result = await StatesGetAllController().getAll();
//     result.fold((failure) {
//       throw Exception(failure);
//     }, (values) {
//       _states = ObservableList.of(values);
//     });
//     _states!.sort((StateModel a, StateModel b) => a.name.compareTo(b.name));

//     if (externalData != null) {
//       var externalStates = [];
//       for (var element in externalData) {
//         element.forEach((key, value) {
//           if (key == 'state') {
//             if (!externalStates.contains(value)) {
//               externalStates.add(value);
//             }
//           }
//         });
//       }
//       _states!.removeWhere(
//         (element) {
//           return !externalStates.contains(element.name);
//         },
//       );
//     }

//     getCitiesBySelectedState(externalData: externalData);
//   }

//   @action
//   Future<void> getCitiesBySelectedState({List<dynamic>? externalData}) async {
//     registerCity(null);
//     var result = await CitiesGetAllController()
//         .getCitiesByState(state: stateSelected.id);
//     result.fold((failure) {
//       throw Exception(failure);
//     }, (values) {
//       _cities = ObservableList.of(values);
//     });
//     _cities!.sort((CityModel a, CityModel b) => a.name.compareTo(b.name));

//     if (externalData != null) {
//       var externalCities = [];
//       for (var element in externalData) {
//         element.forEach((key, value) {
//           if (key == 'city') {
//             if (!externalCities.contains(value)) {
//               externalCities.add(value);
//             }
//           }
//         });
//       }
//       _cities!.removeWhere(
//         (element) {
//           return !externalCities.contains(element.name);
//         },
//       );
//       print(_cities);
//     }
//   }
// }
