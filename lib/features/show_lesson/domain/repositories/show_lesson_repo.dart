import 'package:math_app/features/show_lesson/data/model/show_lesson_dto.dart';

import '../../../../core/resources/data_state.dart';

abstract class ShowLessonRepo{
  Future<DataState<ShowLessonDto>>getLesson({required String slug});
}