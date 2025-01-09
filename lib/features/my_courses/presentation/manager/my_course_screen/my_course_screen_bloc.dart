
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:math_app/core/resources/data_state.dart';

import '../../../data/model/my_course_dto/my_course_dto.dart';
import '../../../domain/repositories/my_course_repo.dart';

part 'my_course_screen_event.dart';
part 'my_course_screen_state.dart';

class MyCourseScreenBloc extends Bloc<MyCourseScreenEvent, MyCourseScreenState> {
  final MyCourseRepo myCourseRepo;
  MyCourseScreenBloc({required this.myCourseRepo}) : super(MyCourseScreenInitial()) {
    on<GetMyCourses>((event, emit)async {
      emit(MyCourseLoading());
      final result=await myCourseRepo.getMyCourses();
      if(result is DataSuccess){
        emit(MyCoursesLoaded(myCourses: result.data??[]));
      }else if(result is DataError){
        if(result.data ==401){
          emit(NoAuth());
        }else{
          emit(MyCoursesError());
        }
      }

    });
    add( GetMyCourses());
  }

}
