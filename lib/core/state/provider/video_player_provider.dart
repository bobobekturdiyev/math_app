// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:math_app/features/home/domain/entity/course_details_entity.dart';
// import 'package:math_app/features/home/domain/entity/lesson_entity.dart';
// import 'package:video_player/video_player.dart';
//
// class CoursePlayerProvider with ChangeNotifier {
//   VideoPlayerController? _videoPlayerController;
//   ChewieController? _chewieController;
//   LessonEntity? _currentLesson;
//   int _currentModuleIndex = 0;
//   int _currentLessonIndex = 0;
//   bool _isInitialized = false;
//
//   VideoPlayerController? get videoPlayerController => _videoPlayerController;
//   ChewieController? get chewieController => _chewieController;
//   LessonEntity? get currentLesson => _currentLesson;
//   bool get isInitialized => _isInitialized;
//   int get currentModuleIndex => _currentModuleIndex;
//   int get currentLessonIndex => _currentLessonIndex;
//
//   Future<void> initializePlayer(LessonEntity lesson) async {
//     if (_videoPlayerController != null) {
//       await _videoPlayerController!.dispose();
//     }
//     if (_chewieController != null) {
//       _chewieController!.dispose();
//     }
//
//     _videoPlayerController = VideoPlayerController.network(lesson.videoUrl);
//     await _videoPlayerController!.initialize();
//
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController!,
//       autoPlay: true,
//       looping: false,
//       aspectRatio: 16 / 9,
//       showControls: true,
//     );
//
//     _currentLesson = lesson;
//     _isInitialized = true;
//     notifyListeners();
//
//     _videoPlayerController!.addListener(_onVideoPositionChanged);
//   }
//
//   void _onVideoPositionChanged() {
//     if (_videoPlayerController != null &&
//         _videoPlayerController!.value.position >=
//             _videoPlayerController!.value.duration) {
//       playNextLesson();
//     }
//   }
//
//   void playLesson(CourseDetailsEntity course, int moduleIndex, int lessonIndex) {
//     final lesson = course.modules[moduleIndex].lessons[lessonIndex];
//     _currentModuleIndex = moduleIndex;
//     _currentLessonIndex = lessonIndex;
//     initializePlayer(lesson);
//   }
//
//   void playNextLesson() {
//     // Bu metodni Course obyektiga qarab to'g'irlash kerak
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController?.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }
// }
