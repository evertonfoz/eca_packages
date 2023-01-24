import 'package:eca_packages/src/dropdown_citys_states/domain/entities/state.dart';

class StateModel extends StateEntity {
  const StateModel({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  /*String modelAsString() {
    return '#$cylinderTypeID $nameCylinder';
  }*/

  @override
  String toString() => '$name';
}
