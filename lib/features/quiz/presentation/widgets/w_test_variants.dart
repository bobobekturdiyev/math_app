import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_select_button.dart';
import 'package:math_app/features/quiz/data/models/option_dto.dart';
import 'package:math_app/features/quiz/presentation/manager/test/test_bloc.dart';

class WTestVariants extends StatefulWidget {
  final Axis axis;
  final List<OptionDto> options;
  final Function(int)? onChange;
  final double? horizontalPadding;
  final int? selectedOptionId;
  final bool disabled;

  const WTestVariants({
    super.key,
    this.axis = Axis.vertical,
    required this.options,
    this.horizontalPadding,
    this.selectedOptionId,
    this.onChange,
    this.disabled = false,
  });

  // const WTestVariants.disabled({
  //   super.key,
  //   this.axis = Axis.vertical,
  //   required this.items,
  //   required this.initialIndex,
  //   this.horizontalPadding,
  //   required this.onChange,
  //   required int correctIndex,
  // })  : _correctIndex = correctIndex,
  //       _disabled = true;

  @override
  State<WTestVariants> createState() => _WTestVariantsState();
}

class _WTestVariantsState extends State<WTestVariants> {
  List<String> _variants = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();

    _generateVariants(widget.options.length);
    if (widget.selectedOptionId != null) {
      _getSelectedIndex(widget.options, widget.selectedOptionId!);
    }
  }

  _generateVariants(int count) {
    _variants = List.generate(
      count,
      (index) => String.fromCharCode(97 + index),
    );
  }

  _getSelectedIndex(List<OptionDto> options, int? selectedOptionId) {
    if (selectedOptionId != null) {
      selectedIndex = options.indexWhere((el) => el.id == selectedOptionId);
    } else {
      selectedIndex = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.disabled) {
      if (widget.axis == Axis.vertical) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: _getChildren(),
        );
      } else {
        return Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: _getChildren(),
        );
      }
    }

    return BlocListener<TestBloc, TestState>(
      listener: (context, state) {
        if (state is TestLoaded) {
          _getSelectedIndex(state.question.options, state.selectedOptionId);
          _generateVariants(state.question.options.length);
        }
      },
      child: BlocBuilder<TestBloc, TestState>(
        builder: (_, state) {
          if (state is TestLoaded) {
            if (widget.axis == Axis.vertical) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: _getChildren(),
              );
            } else {
              return Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: _getChildren(),
              );
            }
          }

          return SizedBox();
        },
      ),
    );
  }

  _getChildren() => List.generate(
        _variants.length,
        (index) {
          final option = widget.options[index];

          Color optionBg = AppColors.white; // Default background color
          Color borderColor = AppColors.borderColor;

          bool correctSelected = false;
          bool incorrectSelected = false;

          if (widget.disabled) {
            // Agar variant tanlangan bo'lsa
            if (selectedIndex == index) {
              // Tanlangan variant to'g'ri yoki xato bo'lsa
              optionBg = option.isCorrect
                  ? AppColors.primaryColorAccent
                  : AppColors.redAccent;
              borderColor =
                  option.isCorrect ? AppColors.primaryColor : AppColors.danger;
              correctSelected = option.isCorrect;
              incorrectSelected = !option.isCorrect;
            } else if (option.isCorrect) {
              // Variant tanlanmagan, lekin u to'g'ri bo'lsa
              optionBg = AppColors.primaryColorAccent;
              borderColor = AppColors.primaryColor;
            }
          } else {
            if (selectedIndex == index) {
              optionBg = AppColors.primaryColorAccent;
              borderColor = AppColors.primaryColor;
            }
          }

          return Padding(
            padding: EdgeInsets.only(
              bottom: widget.horizontalPadding == null
                  ? 8.0
                  : widget.horizontalPadding ?? 0,
              right: widget.axis == Axis.horizontal ? 8.0 : 0,
            ),
            child: GestureDetector(
              onTap: widget.disabled
                  ? null
                  : () {
                      if (selectedIndex != index) {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (widget.onChange != null) {
                          widget.onChange!(widget.options[index].id);
                        }
                      }
                    },
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: optionBg,
                  border: Border.all(
                    color: borderColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: WSelectButton(
                        color: borderColor,
                        margin: EdgeInsets.zero,
                        image: widget.options[index].image,
                        txt:
                            "${_variants[index]}) ${widget.options.isEmpty ? '' : widget.options[index].text}",
                        isSelected: selectedIndex == index,
                        style: Styles.getTextStyle(color: AppColors.black),
                      ),
                    ),
                    if (correctSelected && widget.disabled) ...{
                      SvgPicture.asset(AppIcons.variantCheckSuccess),
                    } else if (incorrectSelected && widget.disabled) ...{
                      SvgPicture.asset(AppIcons.variantCheckFailure),
                    },
                  ],
                ),
              ),
            ),
          );
        },
      );
}
