import 'package:equatable/equatable.dart';
import 'package:footbal/data/models/standings_model.dart';

class StandingsResponse extends Equatable {
  final List<StandingsModel> standingsList;

  const StandingsResponse({required this.standingsList});

  factory StandingsResponse.fromJson(Map<String, dynamic> json) =>
      StandingsResponse(
        standingsList: List<StandingsModel>.from((json['standings'] as List)
            .map((e) => StandingsResponse.fromJson(e))),
      );
  Map<String, dynamic> toJson() => {
        'standings': List<dynamic>.from(
          standingsList.map((e) => e.toJson()),
        ),
      };
  @override
  List<Object> get props => [standingsList];
}
