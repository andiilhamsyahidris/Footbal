part of 'team_by_id_bloc.dart';

abstract class TeamByIdEvent {}

class FetchTeamById extends TeamByIdEvent {
  final int? teamId;

  FetchTeamById(this.teamId);
}
