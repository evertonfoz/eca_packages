import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/datasources/cities.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/models/cities.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/repositories/cities.dart';
import 'package:eca_packages/src/dropdown_citys_states/domain/usecases/cities.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CitiesGetAllController {
  FutureOr<Either<Failure, List<CityModel>>> getCitiesByState(
      {required String state}) async {
    final InProcessingStore inProcessingStore =
        Modular.get<InProcessingStore>();
    inProcessingStore.registerIsInProcessing(true);

    Either<Failure, List<CityModel>> result = await CityGetAllUseCase(
        repository: CityGetAllRepository(
            dataSource: CityGetAllDataSource()))(Params(state: state));

    inProcessingStore.registerIsInProcessing(false);
    return result;
  }
}
