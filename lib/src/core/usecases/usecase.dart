import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  FutureOr<Either<Failure, Type?>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
