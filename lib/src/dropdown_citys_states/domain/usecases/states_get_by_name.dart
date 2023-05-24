import 'package:dartz/dartz.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/models/states.dart';
import 'package:equatable/equatable.dart';

class StateGetByNameUseCase implements UseCase<StateModel, Params> {
  final StateGetlAllRepository repository;

  StateGetByNameUseCase({required this.repository});

  @override
  Future<Either<Failure, StateModel>> call(Params params) {
    return repository.getByName(name: params.name);
  }
}

class Params extends Equatable {
  final String name;

  const Params({required this.name});

  @override
  List<Object> get props => [name];
}
