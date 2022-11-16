import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SeasonProvider extends ChangeNotifier {
  int _index = 0;
  int _seasonId = 0;

  int get index => _index;
  int get seasonId => _seasonId;

  set index(int value) {
    _index = value;
    notifyListeners();
  }

  set seasonId(int value) {
    _seasonId = value;
  }
}
