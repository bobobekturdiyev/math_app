import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/features/quiz/data/models/question_dto.dart';
import 'package:math_app/features/quiz/presentation/manager/test/test_bloc.dart';
import 'package:math_app/features/quiz/presentation/pages/either_result_screen.dart';
import 'package:math_app/features/quiz/presentation/pages/tests_screen/tests_screen_test_loaded.dart';

@RoutePage()
class TestsScreen extends StatefulWidget {
  final List<QuestionDto> questions;
  final String title;
  final int duration;

  const TestsScreen({
    Key? key,
    required this.questions,
    required this.title,
    required this.duration,
  }) : super(key: key);

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  late final TestBloc testBloc = TestBloc(questions: widget.questions);

  @override
  void initState() {
    super.initState();
    testBloc.add(LoadTest());
  }

  @override
  void dispose() {
    testBloc.close();
    super.dispose();
  }

  int? duration;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: testBloc,
      child: BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          if (state is TestLoaded) {
            if (state.duration != null) {
              duration = state.duration;
            }
            return TestsScreenTestLoaded(
              state: state,
              title: widget.title,
              duration: duration ?? 5,
              questions: widget.questions,
              testBloc: testBloc,
            );
          }

          if (state is TestLoading) {
            return const Scaffold(body: Center(child: WLoader()));
          }

          if (state is QuizResultState) {
            return EitherResultScreen(
              quizResultState: state,
              resultType: state.quizResultDto.passed
                  ? ResultType.success
                  : ResultType.failure,
            );
          }

          if (state is QuizResultErrorState) {
            return _buildErrorState(state);
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildErrorState(QuizResultErrorState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.message),
            const SizedBox(height: 12),
            WButton(
              text: "Qayta yuborish",
              onTap: () => testBloc.add(CompleteTest()),
            ),
          ],
        ),
      ),
    );
  }
}
