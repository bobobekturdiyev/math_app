
class LessonShortDto {
  int? id;
  String? title;
  bool? isOpen;
  String? duration;

  LessonShortDto({id, title, isOpen, duration});

  LessonShortDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isOpen = json['is_open'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['is_open'] = isOpen;
    data['duration'] = duration;
    return data;
  }
}
