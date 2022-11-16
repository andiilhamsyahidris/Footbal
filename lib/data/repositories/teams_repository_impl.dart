import 'package:dartz/dartz.dart';
import 'package:footbal/common/exception.dart';
import 'package:footbal/common/failure.dart';
import 'package:footbal/data/datasources/football_remote_datasources.dart';
import 'package:footbal/domain/entities/seasons.dart';
import 'package:footbal/domain/entities/standings.dart';
import 'package:footbal/domain/entities/teams.dart';
import 'package:footbal/domain/repositories/teams_repository.dart';

class TeamsRepositoryImpl implements TeamsRepository {
  final FootballRemoteDatasources footballRemoteDatasources;

  const TeamsRepositoryImpl({required this.footballRemoteDatasources});

  @override
  Future<Either<Failure, List<Teams>>> getTeams() async {
    try {
      final result = await footballRemoteDatasources.getTeams();
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, Teams>> getTeamsById(int? teamId) async {
    try {
      final result = await footballRemoteDatasources.getTeamsById(teamId);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<Seasons>>> getSeasons() async {
    try {
      final result = await footballRemoteDatasources.getSeasons();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<Standings>>> getStandings(int? seasonId) async {
    try {
      final result = await footballRemoteDatasources.getStandings(seasonId);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }
}
