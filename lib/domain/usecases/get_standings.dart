import 'package:dartz/dartz.dart';
import 'package:footbal/common/failure.dart';
import 'package:footbal/domain/entities/standings.dart';
import 'package:footbal/domain/repositories/teams_repository.dart';

class GetStandings {
  final TeamsRepository repository;

  const GetStandings(this.repository);

  Future<Either<Failure, List<Standings>>> execute(int? seasonId) {
    return repository.getStandings(seasonId);
  }
}
