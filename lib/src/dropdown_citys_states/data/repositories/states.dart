import 'package:dartz/dartz.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/datasources/states.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/models/states.dart';

class StateGetlAllRepository {
  final StateGetAllDataSource dataSource;

  StateGetlAllRepository({
    required this.dataSource,
  });

  Future<Either<Failure, List<StateModel>>> getAll() async {
    final states = await dataSource.getAll();
    return Right(states);
  }

  Future<Either<Failure, StateModel>> getByName({required String name}) async {
    final state = await dataSource.getByName(name: name);
    return Right(state);
  }
}
