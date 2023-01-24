// import 'package:mobx/mobx.dart';

// part 'list_preferences.g.dart';

// /// flutter packages pub run build_runner build
// /// flutter packages pub run build_runner build --delete-conflicting-outputs
// /// flutter packages pub run build_runner watch --delete-conflicting-outputs

// // ignore: library_private_types_in_public_api
// class ListPreferencesStore = _ListPreferencesStore with _$ListPreferencesStore;

// abstract class _ListPreferencesStore with Store {
//   _ListPreferencesStore({
//     required String sortProperty,
//     required String sortOrder,
//   }) {
//     setSortProperty(sortProperty);
//     _sortOrder = sortOrder;
//   }

//   @observable
//   String? _sortProperty;

//   @observable
//   String? _sortOrder;

//   @computed
//   String get sortProperty => _sortProperty!;

//   @computed
//   String get sortOrder => _sortOrder!;

//   @action
//   void setSortProperty(String sortProperty) {
//     _sortProperty = sortProperty.replaceAll('ç', 'c').replaceAll('ã', 'a');
//   }

//   @action
//   void setSortOrder(String sortOrder) {
//     _sortOrder = sortOrder;
//   }
// }
