import 'package:math_app/features/home/data/model/course/lesson_dto.dart';
import 'package:math_app/features/home/data/model/quiz/quiz_dto.dart';

class ModuleDto {
  int? id;
  String? name;
  List<LessonDto>? lessons;
  List<QuizDto>? quizzes;

  ModuleDto({id, name, lessons, quizzes});

  ModuleDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['lessons'] != null) {
      lessons = <LessonDto>[];
      json['lessons'].forEach((v) {
        lessons!.add(LessonDto.fromJson(v));
      });
    }
    if (json['quizzes'] != null) {
      quizzes = <QuizDto>[];
      json['quizzes'].forEach((v) {
        quizzes!.add(QuizDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (lessons != null) {
      data['lessons'] = lessons!.map((v) => v.toJson()).toList();
    }
    if (quizzes != null) {
      data['quizzes'] = quizzes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
