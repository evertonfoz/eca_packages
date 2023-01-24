import 'dart:convert';

import 'package:eca_packages/src/dropdown_citys_states/data/models/cities.dart';
import 'package:flutter/services.dart';

class CityGetAllDataSource {
  Future<List<CityModel>> getCitiesByState({required String state}) async {
    var jsonFile = await rootBundle.loadString('assets/json/cidades.json');
    List<dynamic> cities = json.decode(jsonFile) as List;
    return cities
        .map((c) => CityModel.fromJson(c))
        .where((c) => c.state == state)
        .toList(); //TODO Ordenado?
  }
}
