import '../../../../core/resources/data_state.dart';
import '../../data/model/my_course_dto/my_course_dto.dart';

abstract class MyCourseRepo{
  Future<DataState<List<MyCourseDto>>> getMyCourses();
}