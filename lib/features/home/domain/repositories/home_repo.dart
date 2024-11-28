import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/domain/entity/all_course_entity.dart';
import 'package:math_app/core/shared_entities/course_details_entity.dart';



abstract class HomeRepo{
  Future<DataState<List<AllCourseEntity>>> getAllCourse({String? search,String? filter});

  Future<DataState<CourseDetailsEntity>> getCourseDetails({required String slug});

}