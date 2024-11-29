class LessonEntity {
  final int id;
  final String title;
  final String duration;
  final int hasAccess;
  final bool isWatched;
  final String videoUrl;

  LessonEntity(
      {required this.id,
      required this.title,
      required this.duration,
      required this.hasAccess,
      required this.isWatched,
      required this.videoUrl,});
}
