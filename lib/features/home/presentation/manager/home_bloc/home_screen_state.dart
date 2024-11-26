import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:math_app/features/home/domain/entity/all_course_entity.dart';

@immutable
abstract class HomeScreenState extends Equatable{}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class AllCourseLoading extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class AllCourseLoaded extends HomeScreenState {
  final List<AllCourseEntity> allCourse;

  AllCourseLoaded({required this.allCourse});
  @override
  List<Object?> get props =>[];
}

class AllCourseError extends HomeScreenState {
  final String error;

  AllCourseError({required this.error});


  @override
  List<Object?> get props =>[error];
}
