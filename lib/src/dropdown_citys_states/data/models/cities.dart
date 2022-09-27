// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eca_packages/src/dropdown_citys_states/domain/entities/city.dart';

class CityModel extends CityEntity {
  const CityModel({
    required int id,
    required String name,
    required String state,
  }) : super(id: id, name: name, state: state);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'state': state,
    };
  }

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as int,
      name: json['nome'] as String,
      state: json['municipio']['microrregiao']['mesorregiao']['UF']['sigla'],
    );
  }
  @override
  String toString() => name;
}
