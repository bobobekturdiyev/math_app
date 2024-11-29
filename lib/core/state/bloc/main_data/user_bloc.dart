import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/core/shared/domain/repositories/shared_repo.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SharedRepo sharedRepo;
  User? user;

  UserBloc({required this.sharedRepo}) : super(UserState()) {
    on<GetMeEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final result = await sharedRepo.getMe();
      if (result is DataSuccess) {
        user = result.data;
        emit(
            state.copyWith(stateStatus: StateStatus.loaded, user: result.data));
      } else {
        emit(state.copyWith(
            stateStatus: StateStatus.loaded,
            error: result.errorResponse?.message ?? ''));
      }
    });
    add(GetMeEvent());
  }
}
