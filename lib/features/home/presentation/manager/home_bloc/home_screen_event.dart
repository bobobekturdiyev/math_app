




import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeScreenEvent extends Equatable{}


class GetAllCourse extends HomeScreenEvent{
  final String? searchQuery;
  final String? filter;

  GetAllCourse({ this.searchQuery,  this.filter});

  @override
  List<Object?> get props => [searchQuery,filter];
}
