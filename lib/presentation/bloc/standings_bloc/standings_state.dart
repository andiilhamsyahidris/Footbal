part of 'standings_bloc.dart';

abstract class StandingsState extends Equatable {
  const StandingsState();

  @override
  List<Object> get props => [];
}

class StandingsEmpty extends StandingsState {}

class StandingsLoading extends StandingsState {}

class StandingsError extends StandingsState {
  final String message;
  const StandingsError(this.message);

  @override
  List<Object> get props => [message];
}

class StandingsHasData extends StandingsState {
  final List<Standings> standings;

  const StandingsHasData(this.standings);

  @override
  List<Object> get props => [standings];
}
