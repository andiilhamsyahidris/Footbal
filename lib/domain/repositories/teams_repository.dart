import 'package:dartz/dartz.dart';
import 'package:footbal/common/failure.dart';
import 'package:footbal/domain/entities/seasons.dart';
import 'package:footbal/domain/entities/standings.dart';
import 'package:footbal/domain/entities/teams.dart';

abstract class TeamsRepository {
  Future<Either<Failure, List<Teams>>> getTeams();
  Future<Either<Failure, List<Seasons>>> getSeasons();
  Future<Either<Failure, List<Standings>>> getStandings(int? seasonId);
}
