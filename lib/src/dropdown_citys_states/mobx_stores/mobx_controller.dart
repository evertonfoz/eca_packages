import 'package:eogas/features/dropdown_citys_states/data/models/cities_model.dart';
import 'package:eogas/features/dropdown_citys_states/data/models/states_model.dart';
import 'package:eogas/features/dropdown_citys_states/data/repositories/cities_repository.dart';
import 'package:eogas/features/dropdown_citys_states/data/repositories/states_repository.dart';
import 'package:eogas/features/register/presentation/mobx_stores/page_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'mobx_controller.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch --delete-conflicting-outputs

class MobxController = _MobxControllerBase with _$MobxController;

abstract class _MobxControllerBase with Store {
  final PageNavigationStore _pageNavigationStore =
      Modular.get<PageNavigationStore>();
  var citiesRepository = CitiesRepository();
  GlobalKey key = GlobalKey();

  @observable
  List<StateModel>? states;

  @observable
  StateModel? _stateSelected;

  @computed
  StateModel? get stateSelected => _stateSelected;

  @action
  void selectState(StateModel stateSelected) {
    _stateSelected = stateSelected;
    findCities();
  }

  @action
  void findStates() {
    states = StateRepository().findAllStates();
  }

  @observable
  List<CityModel>? cities;

  @observable
  CityModel? citySelected;

  @action
  void selectCity(CityModel? citySelected) {
    citySelected = citySelected;
  }

  @action
  Future<void> findCities() async {
    cities = await citiesRepository.getCitiesByState(_stateSelected!.id);
    cities!.sort((CityModel a, CityModel b) => a.name.compareTo(b.name));
  }
}
