import 'package:dartz/dartz.dart';
import 'package:footbal/common/failure.dart';
import 'package:footbal/domain/entities/teams.dart';
import 'package:footbal/domain/repositories/teams_repository.dart';

class GetTeams {
  final TeamsRepository repository;

  const GetTeams(this.repository);

  Future<Either<Failure, List<Teams>>> execute() {
    return repository.getTeams();
  }
}
