import 'package:equatable/equatable.dart';

class Standings extends Equatable {
  Standings({
    required this.teamId,
    required this.position,
    required this.points,
  });
  int? teamId;
  int? position;
  int? points;

  @override
  List<Object?> get props => [
        teamId,
        position,
        points,
      ];
}
