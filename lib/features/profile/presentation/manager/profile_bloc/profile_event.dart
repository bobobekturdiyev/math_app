part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {}



class AboutAdd extends ProfileEvent{
  final String about;

  AboutAdd({required this.about});
  @override
  List<Object?> get props => [about];

}
class LanguageAdd extends ProfileEvent{
  final String lang;
  final int level;

  LanguageAdd( {required this.lang, required this.level,});
  @override
  List<Object?> get props => [lang, level];

}
class UpdateLang extends ProfileEvent{
  final String lang;
  final int level;
  final int id;

  UpdateLang(  {required this.lang, required this.level,required this.id,});
  @override
  List<Object?> get props => [lang, level,id];

}



class SkillsAdd extends ProfileEvent{
  final StateStatus status;
  final String? text;
  final List<int> tags;

  SkillsAdd(  {this.text, this.status=StateStatus.normal,this.tags=const[] });
  @override
  List<Object?> get props => [status];

}

