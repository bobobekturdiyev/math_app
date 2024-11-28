import 'package:flutter/material.dart';
import 'package:math_app/features/show_lesson/domain/entity/test_entity.dart';

class TestProvider extends ChangeNotifier {
  final List<TestEntity> _tests = [
    TestEntity(
      answer: 'Java',
      variants: ['C', 'Python', 'Java', 'Ruby'],
    ),
    TestEntity(
      answer: 'Paris',
      variants: ['London', 'Berlin', 'Paris', 'Madrid'],
    ),
    TestEntity(
      answer: 'Earth',
      variants: ['Mars', 'Jupiter', 'Venus', 'Earth'],
    ),
    TestEntity(
      answer: '2',
      variants: ['1', '2', '3', '4'],
    ),
    TestEntity(
      answer: 'Beethoven',
      variants: ['Mozart', 'Beethoven', 'Chopin', 'Bach'],
    ),
    TestEntity(
      answer: 'Shakespeare',
      variants: ['Dickens', 'Shakespeare', 'Hemingway', 'Fitzgerald'],
    ),
    TestEntity(
      answer: 'Blue',
      variants: ['Red', 'Blue', 'Green', 'Yellow'],
    ),
    TestEntity(
      answer: 'Lion',
      variants: ['Tiger', 'Elephant', 'Lion', 'Bear'],
    ),
    TestEntity(
      answer: 'Water',
      variants: ['Fire', 'Earth', 'Air', 'Water'],
    ),
    TestEntity(
      answer: '10',
      variants: ['5', '10', '15', '20'],
    ),
  ];

  int _currentIndex = 0;
  Map<int, String?> _answers = {};

  List<TestEntity> get tests => _tests;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void selectAnswer(int index, String answer) {
    _answers[index] = answer;
    notifyListeners();
  }

  bool get isTestComplete => _answers.length == _tests.length;

  String get testResult {
    int correctAnswers = 0;
    for (int i = 0; i < _tests.length; i++) {
      if (_answers[i] == _tests[i].answer) {
        correctAnswers++;
      }
    }
    return '$correctAnswers/${_tests.length}';
  }
}
