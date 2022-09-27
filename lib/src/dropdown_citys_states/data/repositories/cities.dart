import 'package:eca_packages/src/dropdown_citys_states/data/datasources/cities.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/models/cities.dart';

class CitiesRepository {
  final CitiesDataSource dataSource;

  CitiesRepository({
    required this.dataSource,
  });

  Future<List<CityModel>> getAll({required String state}) {
    return dataSource.getCitiesByState(state: state);
  }
}
