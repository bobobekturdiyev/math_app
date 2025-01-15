part of 'test_bloc.dart';

sealed class TestEvent extends Equatable {
  const TestEvent();
}

class LoadTest extends TestEvent {
  const LoadTest();

  @override
  List<Object?> get props => [];
}

class ChooseOption extends TestEvent {
  final int questionId;
  final int optionId;

  const ChooseOption({
    required this.questionId,
    required this.optionId,
  });

  @override
  List<Object?> get props => [questionId, optionId];
}

class SelectQuestion extends TestEvent {
  final int index;

  const SelectQuestion({
    required this.index,
  });

  @override
  List<Object?> get props => [index];
}

class CompleteTest extends TestEvent {
  const CompleteTest();

  @override
  List<Object?> get props => [];
}
