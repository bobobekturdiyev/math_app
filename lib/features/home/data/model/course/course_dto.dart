class CourseDto {
  int? id;
  String? title;
  String? landingTitle;
  String? landingSubtitle;
  String? description;
  String? excerpt;
  int? price;
  String? trailer;
  List<String>? whatToLearn;
  String? type;
  String? image;
  String? level;
  String? slug;
  bool? showRoadmap;
  String? roadmapTitle;
  String? duration;
  String? status;
  String? purchaseType;
  bool? lockModules;
  String? publishDate;
  String? createdAt;
  String? updatedAt;
  int? totalLessons;
  int? totalVideos;

  CourseDto({
    id,
    title,
    landingTitle,
    landingSubtitle,
    description,
    excerpt,
    price,
    trailer,
    whatToLearn,
    type,
    image,
    level,
    slug,
    showRoadmap,
    roadmapTitle,
    duration,
    status,
    purchaseType,
    lockModules,
    publishDate,
    createdAt,
    updatedAt,
    totalLessons,
    totalVideos,
  });

  CourseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    landingTitle = json['landing_title'];
    landingSubtitle = json['landing_subtitle'];
    description = json['description'];
    excerpt = json['excerpt'];
    price = json['price'];
    trailer = json['trailer'];
    whatToLearn = json['what_to_learn'].cast<String>();
    type = json['type'];
    image = json['image'];
    level = json['level'];
    slug = json['slug'];
    showRoadmap = json['show_roadmap'];
    roadmapTitle = json['roadmap_title'];
    duration = json['duration'];
    status = json['status'];
    purchaseType = json['purchase_type'];
    lockModules = json['lock_modules'];
    publishDate = json['publish_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalLessons = json['total_lessons'];
    totalVideos = json['total_videos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['landing_title'] = landingTitle;
    data['landing_subtitle'] = landingSubtitle;
    data['description'] = description;
    data['excerpt'] = excerpt;
    data['price'] = price;
    data['trailer'] = trailer;
    data['what_to_learn'] = whatToLearn;
    data['type'] = type;
    data['image'] = image;
    data['level'] = level;
    data['slug'] = slug;
    data['show_roadmap'] = showRoadmap;
    data['roadmap_title'] = roadmapTitle;
    data['duration'] = duration;
    data['status'] = status;
    data['purchase_type'] = purchaseType;
    data['lock_modules'] = lockModules;
    data['publish_date'] = publishDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total_lessons'] = totalLessons;
    data['total_videos'] = totalVideos;
    return data;
  }
}
