import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/domain/entity/all_course_entity.dart';
import 'package:math_app/features/home/domain/repositories/home_repo.dart';

class HomeUseCases {
  final HomeRepo homeRepo;

  HomeUseCases({required this.homeRepo});


  Future<DataState<List<AllCourseEntity>>> getAllCourse({String? search,String? filter}) async {
    return await homeRepo.getAllCourse(search: search,filter: filter);
  }

}