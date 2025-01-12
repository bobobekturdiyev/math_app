import 'video_dto.dart';

class LessonDto {
  int? id;
  String? title;
  bool? isOpen;
  String? duration;
  String? description;
  List<VideoDto>? videos;

  LessonDto({id, title, isOpen, duration, description, videos});

  LessonDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isOpen = json['is_open'];
    duration = json['duration'];
    description = json['description'];
    if (json['videos'] != null) {
      videos = <VideoDto>[];
      json['videos'].forEach((v) {
        videos!.add(VideoDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['is_open'] = isOpen;
    data['duration'] = duration;
    data['description'] = description;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
