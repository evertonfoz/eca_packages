import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/models/states.dart';
import 'package:eca_packages/src/dropdown_citys_states/domain/usecases/states_get_by_name.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StatesGetByNameController {
  FutureOr<Either<Failure, StateModel>> getByName(
      {required String name}) async {
    final InProcessingStore inProcessingStore =
        Modular.get<InProcessingStore>();
    inProcessingStore.registerIsInProcessing(true);

    Either<Failure, StateModel> result = await StateGetByNameUseCase(
        repository: StateGetlAllRepository(
            dataSource: StateGetAllDataSource()))(Params(name: name));

    inProcessingStore.registerIsInProcessing(false);
    return result;
  }
}
