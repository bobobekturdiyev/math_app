import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/data/data_source/home_service.dart';
import 'package:math_app/features/home/data/model/all_course/all_course_dto.dart';
import 'package:math_app/features/home/data/model/course_details/course_details_dto.dart';
import 'package:math_app/features/home/data/model/lesson_by_course/lesson_by_course.dart';
import 'package:math_app/features/home/domain/repositories/home_repo.dart';

class ImplHomeRepo extends HomeRepo{
  final HomeService homeService;

  ImplHomeRepo({required this.homeService});




  @override
  Future<DataState<List<AllCourseDto>>> getAllCourse()async {
    try{
      final response=await homeService.getAllCourse();

      return DataSuccess<List<AllCourseDto>>(data: response.data.data );

    }catch(e){
      return DataException.getError<List<AllCourseDto>>(e);

    }

  }

  @override
  Future<DataState<CourseDetailsDto>> getCourseDetails({required String slug})async {
    try{
      final response=await homeService.getCourseDetails(slug: slug);
      print(response);

      return DataSuccess<CourseDetailsDto>(data: response.data.data );

    }catch(e){
      print(e);
      return DataException.getError<CourseDetailsDto>(e);

    }
  }

  @override
  Future<DataState<List<LessonByCourseDto>>> getLesson({required String slug})async {
    try{
      final response=await homeService.getLesson(slug: slug);
      print(response);

      return DataSuccess<List<LessonByCourseDto>>(data: response.data.data );

    }catch(e){
      print(e);
      return DataException.getError<List<LessonByCourseDto>>(e);

    }
  }
}

