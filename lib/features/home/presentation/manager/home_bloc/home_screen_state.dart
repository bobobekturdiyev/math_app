





import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/model/all_course/all_course_dto.dart';

@immutable
abstract class HomeScreenState extends Equatable{}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AllCourseLoading extends HomeScreenState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AllCourseLoaded extends HomeScreenState {
  final List<AllCourseDto> allCourse;

  AllCourseLoaded({required this.allCourse});
  @override
  List<Object?> get props =>[];
}

class AllCourseError extends HomeScreenState {


  @override
  List<Object?> get props =>[];
}
