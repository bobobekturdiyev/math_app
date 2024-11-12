
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../data/model/lesson_by_course/lesson_by_course.dart';
import '../../../domain/repositories/home_repo.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final HomeRepo homeRepo;

  LessonsBloc({required this.homeRepo}) : super(LessonsInitial()) {
    on<GetLessons>((event, emit) async{

      emit(LessonsLoading());

      final response=await homeRepo.getLesson(slug: event.slug);
      if(response is DataSuccess){
        emit(LessonsLoaded(lessons: response.data??[], isLogin: true));
      }else{
        emit(LessonsError());
      }

    });

  }

}
