import 'package:equatable/equatable.dart';
import 'package:footbal/data/models/seasons_model.dart';

class SeasonsResponse extends Equatable {
  final List<SeasonsModel> seasonList;

  const SeasonsResponse({required this.seasonList});

  factory SeasonsResponse.fromJson(Map<String, dynamic> json) =>
      SeasonsResponse(
        seasonList: List<SeasonsModel>.from(
          (json['data'] as List).map((e) => SeasonsModel.fromJson(e)),
        ),
      );
  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(
          seasonList.map((e) => e.toJson()),
        ),
      };

  @override
  List<Object> get props => [seasonList];
}
