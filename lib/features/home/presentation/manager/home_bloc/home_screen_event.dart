




import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeScreenEvent extends Equatable{}


class GetAllCourse extends HomeScreenEvent{
  @override
  List<Object?> get props => [];
}