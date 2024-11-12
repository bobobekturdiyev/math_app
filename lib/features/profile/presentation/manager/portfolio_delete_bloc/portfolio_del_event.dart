part of 'portfolio_del_bloc.dart';

@immutable
abstract class PortfolioDelEvent extends Equatable {}
class ExpDelete extends PortfolioDelEvent{
  final int id;

  ExpDelete({required this.id});
  @override
  List<Object?> get props => [id];
}


class EduDelete extends PortfolioDelEvent{
  final int id;

  EduDelete({required this.id});
  @override
  List<Object?> get props => [id];
}
class AwardDelete extends PortfolioDelEvent{
  final int id;

  AwardDelete({required this.id});
  @override
  List<Object?> get props => [id];
}

class LangDelete extends PortfolioDelEvent{
  final int id;

  LangDelete({required this.id});
  @override
  List<Object?> get props => [id];
}
