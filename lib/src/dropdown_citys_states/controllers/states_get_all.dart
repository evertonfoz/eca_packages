import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/datasources/states.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/models/states.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/repositories/states.dart';
import 'package:eca_packages/src/dropdown_citys_states/domain/usecases/states_get_all.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StatesGetAllController {
  FutureOr<Either<Failure, List<StateModel>>> getAll() async {
    final InProcessingStore inProcessingStore =
        Modular.get<InProcessingStore>();
    inProcessingStore.registerIsInProcessing(true);

    Either<Failure, List<StateModel>> result = await StateGetAllUseCase(
        repository: StateGetlAllRepository(
            dataSource: StateGetAllDataSource()))(NoParams());

    inProcessingStore.registerIsInProcessing(false);
    return result;
  }
}
