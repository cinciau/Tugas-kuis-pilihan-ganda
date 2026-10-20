import 'package:flutter/foundation.dart';

class QuizProvider extends ChangeNotifier {
  String _playerName = '';

  String get playerName => _playerName;

  void setPlayerName(String name) {
    _playerName = name.trim();
    notifyListeners();
  }
}