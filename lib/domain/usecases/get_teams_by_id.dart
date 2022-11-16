import 'package:dartz/dartz.dart';
import 'package:footbal/common/failure.dart';
import 'package:footbal/domain/entities/teams.dart';
import 'package:footbal/domain/repositories/teams_repository.dart';

class GetTeamsById {
  final TeamsRepository repository;

  const GetTeamsById(this.repository);

  Future<Either<Failure, Teams>> execute(int? teamId) {
    return repository.getTeamsById(teamId);
  }
}
