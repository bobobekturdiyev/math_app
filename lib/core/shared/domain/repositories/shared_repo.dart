import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';

abstract class SharedRepo{
  Future<DataState<User?>> getMe();

}