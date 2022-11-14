part of 'standings_bloc.dart';

abstract class StandingsEvent {
  const StandingsEvent();
}

class FetchStandings extends StandingsEvent {
  final int seasonId;
  const FetchStandings(this.seasonId);
}
