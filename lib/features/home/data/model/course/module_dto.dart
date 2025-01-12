import 'package:math_app/features/home/data/model/course/lesson_dto.dart';

class ModuleDto {
  int? id;
  String? name;
  List<LessonDto>? lessons;

  ModuleDto({id, name, lessons});

  ModuleDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['lessons'] != null) {
      lessons = <LessonDto>[];
      json['lessons'].forEach((v) {
        lessons!.add(LessonDto.fromJson(v));
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
    return data;
  }
}
