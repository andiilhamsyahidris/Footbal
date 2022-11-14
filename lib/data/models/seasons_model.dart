import 'package:equatable/equatable.dart';
import 'package:footbal/domain/entities/seasons.dart';

class SeasonsModel extends Equatable {
  const SeasonsModel({
    required this.seasonId,
    required this.name,
    required this.leagueId,
    required this.countryId,
    required this.startDate,
    required this.endDate,
  });

  final int seasonId;
  final String name;
  final int countryId;
  final int leagueId;
  final String startDate;
  final String endDate;

  factory SeasonsModel.fromJson(Map<String, dynamic> json) => SeasonsModel(
        seasonId: json['season_id'],
        name: json['name'],
        countryId: json['country_id'],
        leagueId: json['league_id'],
        startDate: json['start_date'],
        endDate: json['end_date'],
      );
  Map<String, dynamic> toJson() => {
        'season_id': seasonId,
        'name': name,
        'country_id': countryId,
        'league_id': leagueId,
        'start_date': startDate,
        'end_date': endDate,
      };
  Seasons toEntity() {
    return Seasons(
        seasonId: seasonId,
        name: name,
        countryId: countryId,
        leagueId: leagueId,
        startDate: startDate,
        endDate: endDate);
  }

  @override
  List<Object?> get props => [
        seasonId,
        name,
        countryId,
        leagueId,
        startDate,
        endDate,
      ];
}
