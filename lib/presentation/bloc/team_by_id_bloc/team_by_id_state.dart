part of 'team_by_id_bloc.dart';

abstract class TeamByIdState extends Equatable {
  const TeamByIdState();

  @override
  List<Object> get props => [];
}

class TeamByIdEmpty extends TeamByIdState {}

class TeamByIdLoading extends TeamByIdState {}

class TeamByIdError extends TeamByIdState {
  final String message;
  const TeamByIdError(this.message);

  @override
  List<Object> get props => [message];
}

class TeamByIdHasData extends TeamByIdState {
  final Teams team;
  const TeamByIdHasData(this.team);

  @override
  List<Object> get props => [team];
}
