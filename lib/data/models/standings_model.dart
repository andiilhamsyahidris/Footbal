import 'package:equatable/equatable.dart';
import 'package:footbal/domain/entities/standings.dart';

class StandingsModel extends Equatable {
  const StandingsModel({
    required this.teamId,
    required this.position,
    required this.points,
  });
  final int teamId;
  final int position;
  final int points;

  factory StandingsModel.fromJson(Map<String, dynamic> json) => StandingsModel(
        teamId: json['team_id'],
        position: json['position'],
        points: json['points'],
      );
  Map<String, dynamic> toJson() => {
        'team_id': teamId,
        'position': position,
        'points': points,
      };

  Standings toEntity() {
    return Standings(
      teamId: teamId,
      position: position,
      points: points,
    );
  }

  @override
  List<Object?> get props => [
        teamId,
        position,
        points,
      ];
}
