import 'package:dartz/dartz.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/models/states.dart';
import 'package:eca_packages/src/dropdown_citys_states/data/repositories/states.dart';

class StateGetAllUseCase implements UseCase<List<StateModel>, NoParams> {
  final StateRepository repository;

  StateGetAllUseCase({required this.repository});

  @override
  Future<Either<Failure, List<StateModel>>> call(NoParams params) {
    return repository.getAll();
  }
}
