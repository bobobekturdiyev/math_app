import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/domain/repositories/course_repo.dart';

import '../../../data/model/course/category_dto.dart';

part 'category_home_event.dart';
part 'category_home_state.dart';

class CategoryHomeBloc extends Bloc<CategoryHomeEvent, CategoryHomeState> {
  late CourseRepo courseRepo;
  List<CategoryDto> categories = [];
  int selectedId = 0;

  CategoryHomeBloc() : super(CategoryHomeInitial()) {
    courseRepo = locator<CourseRepo>();

    on<LoadCategories>((event, emit) async {
      emit(CategoryHomeLoading());

      final result = await courseRepo.getCategories();

      if (result is DataSuccess) {
        categories = result.data!;
        emit(CategoryHomeLoaded(categories: categories));
      } else {
        emit(CategoryHomeError(
            message:
                result.errorMessage ?? 'Bo\'limni olishda nimadir xato ketdi'));
      }
    });

    on<CategoryHomeSelect>((event, emit) async {
      emit(CategoryHomeLoading());
      selectedId = event.id;
      emit(CategoryHomeLoaded(categories: categories));
    });

    on<CategoryHomeHideSelect>((event, emit) async {
      emit(CategoryHomeLoading());
      selectedId = -1;
      emit(CategoryHomeLoaded(categories: categories));
    });

    add(LoadCategories());
  }
}
