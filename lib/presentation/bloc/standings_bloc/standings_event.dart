part of 'standings_bloc.dart';

abstract class StandingsEvent {}

class FetchStandings extends StandingsEvent {
  final int? seasonId;
  FetchStandings(this.seasonId);
}
