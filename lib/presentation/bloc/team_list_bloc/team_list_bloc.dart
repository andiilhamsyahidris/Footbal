import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footbal/domain/entities/teams.dart';
import 'package:footbal/domain/usecases/get_teams.dart';

part 'team_list_event.dart';
part 'team_list_state.dart';

class TeamListBloc extends Bloc<TeamListEvent, TeamListState> {
  final GetTeams getTeams;

  TeamListBloc({required this.getTeams}) : super(TeamListEmpty()) {
    on<FetchTeamList>((event, emit) async {
      emit(TeamListLoading());

      final teamList = await getTeams.execute();

      teamList.fold(
        (failure) => emit(TeamListError(failure.message)),
        (data) => emit(TeamListHasData(data)),
      );
    });
  }
}
