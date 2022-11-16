import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footbal/domain/entities/teams.dart';
import 'package:footbal/domain/usecases/get_teams_by_id.dart';

part 'team_by_id_event.dart';
part 'team_by_id_state.dart';

class TeamByIdBloc extends Bloc<TeamByIdEvent, TeamByIdState> {
  final GetTeamsById getTeamsById;
  TeamByIdBloc({required this.getTeamsById}) : super(TeamByIdEmpty()) {
    on<FetchTeamById>((event, emit) async {
      emit(TeamByIdLoading());

      final teamId = event.teamId;
      final teamById = await getTeamsById.execute(teamId);

      teamById.fold(
        (failure) => emit(TeamByIdError(failure.message)),
        (data) => emit(TeamByIdHasData(data)),
      );
    });
  }
}
