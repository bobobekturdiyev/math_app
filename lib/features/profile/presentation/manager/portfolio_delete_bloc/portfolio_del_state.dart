part of 'portfolio_del_bloc.dart';

@immutable
abstract class PortfolioDelState extends Equatable {}

class PortfolioDelInitial extends PortfolioDelState {
  @override
  List<Object?> get props => throw [];
}


class DelState extends PortfolioDelState {
  final StateStatus status;

  DelState({required this.status});
  @override
  List<Object?> get props => [];
}

class DelSuccess extends PortfolioDelState {
  @override
  List<Object?> get props => [];
}
