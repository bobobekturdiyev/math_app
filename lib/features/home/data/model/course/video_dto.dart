class VideoDto {
  int? id;
  String? name;
  String? fileUrl;
  int? duration;
  String? status;
  String? createdAt;
  String? updatedAt;

  VideoDto({
    id,
    name,
    fileUrl,
    duration,
    status,
    createdAt,
    updatedAt,
  });

  VideoDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fileUrl = json['file_url'];
    duration = json['duration'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['file_url'] = fileUrl;
    data['duration'] = duration;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
