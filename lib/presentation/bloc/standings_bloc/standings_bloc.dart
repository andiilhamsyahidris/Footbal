import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footbal/data/models/standings_model.dart';
import 'package:footbal/domain/entities/standings.dart';
import 'package:footbal/domain/usecases/get_standings.dart';
part 'standings_event.dart';
part 'standings_state.dart';

class StandingsBloc extends Bloc<StandingsEvent, StandingsState> {
  final GetStandings getStandings;
  StandingsBloc({required this.getStandings}) : super(StandingsEmpty()) {
    on<FetchStandings>((event, emit) async {
      emit(StandingsLoading());

      final id = event.seasonId;
      final standingList = await getStandings.execute(id);

      standingList.fold(
        (failure) => emit(StandingsError(failure.message)),
        (data) => emit(StandingsHasData(standings: data)),
      );
    });
  }
}
