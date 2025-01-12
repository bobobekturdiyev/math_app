import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/resources/app_keys.dart';
import '../../../data/model/all_info_dto/all_info_dto.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ProfileRepo profileRepo;
  bool isLogin = false;
  late SharedPreferences prefs;
  late AllInfoDto allInfoDto;

  UserBloc({required this.profileRepo}) : super(UserInitial()) {
    checkLogin();

    on<GetUserData>((event, emit) async {
      if (isLogin) {
        emit(UserLoading());
        final result = await profileRepo.getUserData();
        if (result is DataSuccess) {
          allInfoDto = result.data!;
          emit(UserLoaded(allInfoDto: result.data!));
        } else {
          if (401 == 401) {
            isLogin = false;
          } else {
            emit(UserError());
          }
        }
      }
    });
    on<LogOut>((event, emit) async {
      if (isLogin) {
        emit(UserLoading());
        final result = await profileRepo.logout();
        if (result is DataSuccess) {
          await prefs.clear();
          // Restart.restartApp();
        } else {
          emit(LogOutState(
              status: StateStatus.error, error: result.errorMessage));
        }
      }
    });
  }

  checkLogin() async {
    prefs = await SharedPreferences.getInstance();
    prefs.getString(AppKeys.token) == '' ||
            prefs.getString(AppKeys.token) == null
        ? isLogin = false
        : isLogin = true;
  }
}
