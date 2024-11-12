




import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/repositories/home_repo.dart';
import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final HomeRepo homeRepo;
  HomeScreenBloc({required this.homeRepo}) : super(HomeScreenInitial()) {

    on<GetAllCourse>((event, emit)async {
      emit(AllCourseLoading());

      final response=await homeRepo.getAllCourse();
      if(response is DataSuccess){
        emit(AllCourseLoaded(allCourse: response.data??[]));
      }else{
        emit(AllCourseError());
      }
    });
    add(GetAllCourse());
  }

}
