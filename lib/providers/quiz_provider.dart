import 'package:flutter/foundation.dart';
import '../data/dummy_questions.dart';
import '../models/question.dart';

class QuizProvider extends ChangeNotifier {
  String _playerName = '';
  int _currentIndex = 0;
  final List<int?> _answers =
      List<int?>.filled(dummyQuestions.length, null);

  String get playerName => _playerName;
  int get currentIndex => _currentIndex;
  int get totalQuestions => dummyQuestions.length;
  Question get currentQuestion => dummyQuestions[_currentIndex];
  int? get selectedAnswer => _answers[_currentIndex];
  bool get isAnswered => selectedAnswer != null;
  bool get isLastQuestion => _currentIndex == totalQuestions - 1;
  double get progress => (_currentIndex + 1) / totalQuestions;

  int get score {
    int total = 0;
    for (int i = 0; i < dummyQuestions.length; i++) {
      if (_answers[i] == dummyQuestions[i].correctIndex) total++;
    }
    return total;
  }

  void setPlayerName(String name) {
    _playerName = name.trim();
    notifyListeners();
  }

  void selectAnswer(int index) {
    if (isAnswered) return;
    _answers[_currentIndex] = index;
    notifyListeners();
  }

  void nextQuestion() {
    if (isLastQuestion) return;
    _currentIndex++;
    notifyListeners();
  }

  void resetQuiz() {
    _currentIndex = 0;
    _answers.fillRange(0, _answers.length, null);
    notifyListeners();
  }
}