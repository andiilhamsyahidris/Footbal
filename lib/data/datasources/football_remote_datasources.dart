import 'package:footbal/common/exception.dart';
import 'package:footbal/data/models/seasons_model.dart';
import 'package:footbal/data/models/seasons_response.dart';
import 'package:footbal/data/models/standings_model.dart';
import 'package:footbal/data/models/standings_response.dart';
import 'package:footbal/data/models/teams_model.dart';
import 'package:footbal/data/models/teams_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class FootballRemoteDatasources {
  Future<List<TeamsModel>> getTeams();
  Future<TeamsModel> getTeamsById(int? teamId);
  Future<List<SeasonsModel>> getSeasons();
  Future<List<StandingsModel>> getStandings(int? seasonId);
}

class FootballRemoteDatasourcesImpl implements FootballRemoteDatasources {
  static const apikey = 'apikey=d2b3f2c0-52dc-11ed-85a9-77984e0300d6';
  static const baseUrl = 'https://app.sportdataapi.com/api/v1/soccer';

  final http.Client client;

  FootballRemoteDatasourcesImpl({required this.client});

  @override
  Future<List<TeamsModel>> getTeams() async {
    final response =
        await client.get(Uri.parse('$baseUrl/teams?$apikey&country_id=58'));

    if (response.statusCode == 200) {
      return TeamsResponse.fromJson(json.decode(response.body)).teamList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SeasonsModel>> getSeasons() async {
    final response =
        await client.get(Uri.parse('$baseUrl/seasons?$apikey&league_id=108'));
    if (response.statusCode == 200) {
      return SeasonsResponse.fromJson(json.decode(response.body)).seasonList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<StandingsModel>> getStandings(int? seasonId) async {
    final response = await client
        .get(Uri.parse('$baseUrl/standings?$apikey&season_id=$seasonId'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['data'];
      return StandingsResponse.fromJson(data).standingsList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TeamsModel> getTeamsById(int? teamId) async {
    final response =
        await client.get(Uri.parse('$baseUrl/teams/$teamId?$apikey'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonResponse['data'];
      return TeamsModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
