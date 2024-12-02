


import 'dart:io';

import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';

abstract class ProfileRepo {





  Future<DataState> logout();

  Future<DataState<User>> updateUserImage({required File image});

  Future<DataState<User>> updateProfileInfo({
    required String address,
    required String email,
    required String birthday,
  });
}