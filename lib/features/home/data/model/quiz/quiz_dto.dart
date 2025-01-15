class QuizDto {
  int? id;
  String? title;
  int? passingScore;
  int? defaultScore;
  int? duration;
  String? durationText;
  int? questionsCount;

  QuizDto({
    id,
    title,
    passingScore,
    defaultScore,
    duration,
    questionsCount,
  });

  QuizDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    passingScore = json['passing_score'];
    duration = json['duration'];
    durationText = json['duration_text'];
    defaultScore = json['default_score'];
    questionsCount = json['questions_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['passing_score'] = passingScore;
    data['duration'] = duration;
    data['duration_text'] = durationText;
    data['default_score'] = defaultScore;
    data['questions_count'] = questionsCount;
    return data;
  }
}
