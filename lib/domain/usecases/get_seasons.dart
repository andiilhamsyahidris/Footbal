import 'package:dartz/dartz.dart';
import 'package:footbal/common/failure.dart';
import 'package:footbal/domain/entities/seasons.dart';
import 'package:footbal/domain/repositories/teams_repository.dart';

class GetSeasons {
  final TeamsRepository repository;

  const GetSeasons(this.repository);

  Future<Either<Failure, List<Seasons>>> execute() {
    return repository.getSeasons();
  }
}
