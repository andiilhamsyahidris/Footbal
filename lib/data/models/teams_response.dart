import 'package:equatable/equatable.dart';
import 'package:footbal/data/models/teams_model.dart';

class TeamsResponse extends Equatable {
  final List<TeamsModel> teamList;

  const TeamsResponse({required this.teamList});

  factory TeamsResponse.fromJson(Map<String, dynamic> json) => TeamsResponse(
        teamList: List<TeamsModel>.from(
          (json['data'] as List).map((e) => TeamsModel.fromJson(e)),
        ),
      );
  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(
          teamList.map((e) => e.toJson()),
        ),
      };
  @override
  List<Object> get props => [teamList];
}
