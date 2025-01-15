import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/resources/all_resources.dart';
import 'package:math_app/core/resources/question_selection_state.dart';
import 'package:math_app/core/widgets/countdown_timer.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/features/quiz/presentation/manager/test/test_bloc.dart';
import 'package:math_app/features/quiz/presentation/widgets/w_question_number_box.dart';

import '../../../data/models/question_dto.dart';
import '../../widgets/w_test_variants.dart';
import 'tests_screen_dialogs.dart';

class TestsScreenTestLoaded extends StatelessWidget {
  final TestLoaded state;
  final List<QuestionDto> questions;
  final String title;
  final int duration;
  final TestBloc testBloc;

  const TestsScreenTestLoaded({
    super.key,
    required this.state,
    required this.title,
    required this.duration,
    required this.questions,
    required this.testBloc,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, dynamic) {
        if (didPop) return;
        showBackDialog(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              _buildHeader(context),
              _buildQuestionNavigator(),
              _buildQuestionContent(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => context.router.maybePop(),
            child: SvgPicture.asset(AppIcons.arrowLeftBadge),
          ),
          const SizedBox(width: 12),
          Text(title, style: Styles.getTextStyle(fontSize: 16)),
        ],
      ),
      actions: [
        if (duration > 0)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CountdownTimer(
              durationInSeconds: duration,
              onTimerEnd: () => testBloc.add(CompleteTest()),
              warningCallback: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Testni yakunlashga atigi 15 soniya vaqt qoldi",
                      style: const TextStyle(color: AppColors.white),
                    ),
                    backgroundColor: AppColors.danger,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildQuestionNavigator() {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.white,
      title: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            state.questions.length,
            (index) {
              final question = state.questions[index];
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (question.questionSelectionState !=
                      QuestionSelectionState.unselected) {
                    testBloc.add(SelectQuestion(index: index));
                  }
                },
                child: WQuestionNumberBox(
                  index: index,
                  questionSelectionState: question.questionSelectionState,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            if (state.question.text != null)
              _buildTextContent(state.question.text!),
            if (state.question.image != null)
              _buildImageContent(state.question.image!),
            const SizedBox(height: 20),
            WTestVariants(
              options: state.question.options,
              selectedOptionId: state.selectedOptionId,
              onChange: (optionId) {
                testBloc.add(ChooseOption(
                  questionId: state.question.id,
                  optionId: optionId,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContent(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.getTextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildImageContent(String imageUrl) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fitWidth,
          width: double.infinity,
          errorWidget: (ctx, str, obj) {
            return const Center(
              child: Icon(Icons.image, color: AppColors.grey),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _buildPrevButton(),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: _buildNextOrFinishButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPrevButton() {
    return WButton(
      borderRadius: 16,
      verticalPadding: 10,
      buttonType: ButtonType.outline,
      color: state.prevQuestionIndex != null
          ? AppColors.grey
          : AppColors.borderColor,
      onTap: () {
        if (state.prevQuestionIndex != null) {
          testBloc.add(SelectQuestion(index: state.prevQuestionIndex!));
        }
      },
      text: '',
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.arrowLeft,
            colorFilter: state.prevQuestionIndex != null
                ? ColorFilter.mode(AppColors.grey, BlendMode.srcIn)
                : null,
          ),
          const SizedBox(width: 4),
          Text(
            "Ortga",
            style: Styles.getButtonStyle().copyWith(
              color: state.prevQuestionIndex != null
                  ? AppColors.grey
                  : AppColors.backBtnTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextOrFinishButton(BuildContext context) {
    return WButton(
      borderRadius: 16,
      text: state.nextQuestionIndex == null ? "Yakunlash" : "Keyingi savol",
      onTap: () {
        if (state.nextQuestionIndex != null) {
          testBloc.add(SelectQuestion(index: state.nextQuestionIndex!));
        } else {
          showFinishDialog(context, onTap: () {
            testBloc.add(CompleteTest());
            context.router.maybePop();
          });
        }
      },
    );
  }
}
