import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footbal/domain/entities/seasons.dart';
import 'package:footbal/domain/usecases/get_seasons.dart';

part 'seasons_event.dart';
part 'seasons_state.dart';

class SeasonsBloc extends Bloc<SeasonsEvent, SeasonsState> {
  final GetSeasons getSeasons;

  SeasonsBloc({required this.getSeasons}) : super(SeasonsEmpty()) {
    on<FetchSeasons>((event, emit) async {
      emit(SeasonsLoading());

      final seasonList = await getSeasons.execute();

      seasonList.fold(
        (failure) => emit(SeasonsError(failure.message)),
        (data) => emit(SeasonsHasData(data)),
      );
    });
  }
}
