import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/features/home/data/model/course/module_dto.dart';

import '../../../../../core/di/locator.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/repositories/course_repo.dart';

part 'course_module_event.dart';
part 'course_module_state.dart';

class CourseModuleBloc extends Bloc<CourseModuleEvent, CourseModuleState> {
  late CourseRepo courseRepo;
  List<ModuleDto> modules = [];

  CourseModuleBloc() : super(CourseModuleInitial()) {
    courseRepo = locator<CourseRepo>();

    on<LoadModules>(
      (event, emit) async {
        emit(CourseModuleLoading());

        final result = await courseRepo.getModules(courseId: event.courseId);

        if (result is DataSuccess) {
          modules = result.data!;
          emit(CourseModuleLoaded(modules: modules));
        } else {
          emit(CourseModuleError(
              message:
                  result.errorMessage ?? 'Kursni olishda nimadir xato ketdi'));
        }
      },
    );
  }
}
