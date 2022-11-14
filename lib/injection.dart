import 'package:footbal/data/datasources/football_remote_datasources.dart';
import 'package:footbal/data/repositories/teams_repository_impl.dart';
import 'package:footbal/domain/repositories/teams_repository.dart';
import 'package:footbal/domain/usecases/get_seasons.dart';
import 'package:footbal/domain/usecases/get_teams.dart';
import 'package:footbal/presentation/bloc/season_bloc/seasons_bloc.dart';
import 'package:footbal/presentation/bloc/team_list_bloc/team_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => TeamListBloc(
      getTeams: locator(),
    ),
  );
  locator.registerFactory(
    () => SeasonsBloc(
      getSeasons: locator(),
    ),
  );

  // usecase
  locator.registerLazySingleton(() => GetTeams(locator()));
  locator.registerLazySingleton(() => GetSeasons(locator()));

  // repository
  locator.registerLazySingleton<TeamsRepository>(
    () => TeamsRepositoryImpl(
      footballRemoteDatasources: locator(),
    ),
  );

  // datasources
  locator.registerLazySingleton<FootballRemoteDatasources>(
    () => FootballRemoteDatasourcesImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
