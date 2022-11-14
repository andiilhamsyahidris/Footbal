import 'package:equatable/equatable.dart';

class Seasons extends Equatable {
  Seasons({
    required this.seasonId,
    required this.name,
    required this.countryId,
    required this.leagueId,
    required this.startDate,
    required this.endDate,
  });
  int? seasonId;
  String? name;
  int? countryId;
  int? leagueId;
  String? startDate;
  String? endDate;

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
