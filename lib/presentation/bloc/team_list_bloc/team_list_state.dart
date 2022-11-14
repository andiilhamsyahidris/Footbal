part of 'team_list_bloc.dart';

abstract class TeamListState extends Equatable {
  const TeamListState();

  @override
  List<Object> get props => [];
}

class TeamListEmpty extends TeamListState {}

class TeamListLoading extends TeamListState {}

class TeamListError extends TeamListState {
  final String message;
  const TeamListError(this.message);

  @override
  List<Object> get props => [message];
}

class TeamListHasData extends TeamListState {
  final List<Teams> teams;

  const TeamListHasData(this.teams);

  @override
  List<Object> get props => [
        teams,
      ];
}
