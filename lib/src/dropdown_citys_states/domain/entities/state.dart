import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  final String id;
  final String name;

  const StateEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id];
}
