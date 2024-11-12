import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/show_lesson/data/data_source/show_lesson_service.dart';
import 'package:math_app/features/show_lesson/data/model/show_lesson_dto.dart';
import 'package:math_app/features/show_lesson/domain/repositories/show_lesson_repo.dart';

class ImplShowLessonRepo extends ShowLessonRepo{
 final ShowLessonService service;

  ImplShowLessonRepo({required this.service});

  @override
  Future<DataState<ShowLessonDto>> getLesson({required String slug})async {
    try{
      final response=await service.getLesson(slug: slug);
      return DataSuccess<ShowLessonDto>(data: response.data.data);
    }catch(e){
      print(e);
      return DataException.getError<ShowLessonDto>(e);
    }
  }
}