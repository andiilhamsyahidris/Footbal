// import 'package:dartz/dartz.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:footbal/common/failure.dart';
// import 'package:footbal/data/datasources/football_remote_datasources.dart';
// import 'package:footbal/domain/entities/standings.dart';

// enum ResultState { loading, hasData, empty, error }

// class StandingsProvider extends ChangeNotifier {
//   final FootballRemoteDatasources footballRemoteDatasources;
//   StandingsProvider({required this.footballRemoteDatasources});

//   List<Standings> _standings = <Standings>[];
//   ResultState _state = ResultState.hasData;

//   bool _isFetch = false;
//   int? _seasonId = 0;

//   List<Standings> get standings => _standings;
//   ResultState get state => _state;
//   bool get isFetch => _isFetch;
//   int? get seasonId => _seasonId;

//   set standings(List<Standings> value) {
//     _standings = value;
//     notifyListeners();
//   }

//   set isFetch(bool value) {
//     _isFetch = value;
//     notifyListeners();
//   }

//   set seasonId(int? value) {
//     _seasonId = value;
//     notifyListeners();
//   }

//   Future<dynamic> searchStandings(int? seasonid) async {
//     try {
//       _state = ResultState.loading;
//       notifyListeners();
//       _seasonId = seasonid;

//       final result = await footballRemoteDatasources.getStandings(_seasonId);
//       _standings = result;
//       print(_standings);

//       _state = ResultState.hasData;
//       notifyListeners();

//       return _standings;
//     } catch (_) {
//       _state = ResultState.error;
//       notifyListeners();

//       return 'Gagal memuat data';
//     }
//   }
// }
