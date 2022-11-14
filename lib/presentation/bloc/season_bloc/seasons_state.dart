part of 'seasons_bloc.dart';

abstract class SeasonsState extends Equatable {
  const SeasonsState();

  @override
  List<Object> get props => [];
}

class SeasonsEmpty extends SeasonsState {}

class SeasonsLoading extends SeasonsState {}

class SeasonsError extends SeasonsState {
  final String message;
  const SeasonsError(this.message);

  @override
  List<Object> get props => [message];
}

class SeasonsHasData extends SeasonsState {
  final List<Seasons> seasons;

  const SeasonsHasData(this.seasons);

  @override
  List<Object> get props => [
        seasons,
      ];
}
