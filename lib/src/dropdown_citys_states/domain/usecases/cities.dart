// import 'package:dartz/dartz.dart';
// import 'package:eca_packages/eca_packages.dart';
// import 'package:eca_packages/src/dropdown_citys_states/data/models/cities.dart';
// import 'package:eca_packages/src/dropdown_citys_states/data/repositories/cities.dart';
// import 'package:equatable/equatable.dart';

// class CityGetAllUseCase implements UseCase<List<CityModel>, Params> {
//   final CityGetAllRepository repository;

//   CityGetAllUseCase({required this.repository});

//   @override
//   Future<Either<Failure, List<CityModel>>> call(Params params) {
//     return repository.getCitiesByState(state: params.state);
//   }
// }

// class Params extends Equatable {
//   final String state;

//   const Params({
//     required this.state,
//   });

//   @override
//   List<Object> get props => [state];
// }
