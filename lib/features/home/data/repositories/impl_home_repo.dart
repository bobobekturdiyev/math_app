import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/shared_mapper/shared_mapper.dart';
import 'package:math_app/features/home/data/mapper/home_mapper.dart';
import 'package:math_app/features/home/domain/entity/all_course_entity.dart';
import 'package:math_app/core/shared_entities/course_details_entity.dart';
import 'package:math_app/features/home/domain/repositories/home_repo.dart';
import 'package:math_app/features/home/data/data_source/home_service.dart';


class ImplHomeRepo extends HomeRepo {
  final HomeService homeService;
  final HomeMapper _homeMapper = HomeMapper();
  final SharedMapper _sharedMapper = SharedMapper();

  ImplHomeRepo({required this.homeService});

  @override
  Future<DataState<List<AllCourseEntity>>> getAllCourse({String? search,String? filter}) async {
    try {
      final response = await homeService.getAllCourse(filter: filter,searchQuery: search);

      return DataSuccess<List<AllCourseEntity>>(
          data:
              _homeMapper.getAllCourseListDtoToEntityList(response.data.data));
    } catch (e) {
      return DataException.getError<List<AllCourseEntity>>(e);
    }
  }

  @override
  Future<DataState<CourseDetailsEntity>> getCourseDetails(
      {required String slug}) async {
    try {
      final response = await homeService.getCourseDetails(slug: slug);
      print(response);

      return DataSuccess<CourseDetailsEntity>(
          data: _sharedMapper.getCourseDetailsDtoToEntity(response.data));
    } catch (e) {
      print(e);
      return DataException.getError<CourseDetailsEntity>(e);
    }
  }
}
