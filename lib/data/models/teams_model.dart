import 'package:equatable/equatable.dart';
import 'package:footbal/domain/entities/teams.dart';

class TeamsModel extends Equatable {
  const TeamsModel({
    required this.teamId,
    required this.name,
    required this.shortName,
    required this.logo,
  });

  final int teamId;
  final String name;
  final String shortName;
  final String logo;

  factory TeamsModel.fromJson(Map<String, dynamic> json) => TeamsModel(
        teamId: json['team_id'],
        name: json['name'],
        shortName: json['short_code'],
        logo: json['logo'],
      );
  Map<String, dynamic> toJson() => {
        'team_id': teamId,
        'name': name,
        'short_code': shortName,
        'logo': logo,
      };
  Teams toEntity() {
    return Teams(
      teamId: teamId,
      name: name,
      shortName: shortName,
      logo: logo,
    );
  }

  @override
  List<Object?> get props => [
        teamId,
        name,
        shortName,
        logo,
      ];
}
