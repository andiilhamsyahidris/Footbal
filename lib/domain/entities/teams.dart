import 'package:equatable/equatable.dart';

class Teams extends Equatable {
  Teams({
    required this.teamId,
    required this.name,
    required this.shortName,
    required this.logo,
  });

  int? teamId;
  String? name;
  String? shortName;
  String logo;

  @override
  List<Object?> get props => [
        teamId,
        name,
        shortName,
        logo,
      ];
}
