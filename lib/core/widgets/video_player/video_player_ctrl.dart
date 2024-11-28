import 'package:flutter/material.dart';
import 'package:math_app/core/extensions/video_type_ext.dart';
import 'package:math_app/core/widgets/video_player/universal_video_player.dart';
import 'package:math_app/core/shared_entities/lesson_entity.dart';

import 'package:pod_player/pod_player.dart';

class VideoController extends ChangeNotifier {
  final List<LessonEntity> playlist;
  late PodPlayerController playerController;
  int _currentIndex = 0;

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  int get currentIndex => _currentIndex;

  LessonEntity get currentVideo => playlist[_currentIndex];

  VideoController({required this.playlist}) {
    if(playlist.isNotEmpty){
      _initializePlayer();

    }
  }

  void _initializePlayer() {
    _setupPlayer(playlist[_currentIndex]);
  }

  void _setupPlayer(LessonEntity video) {
    PlayVideoFrom videoSource;
    switch (video.videoUrl.videoType) {
      case VideoSourceType.youtube:
        videoSource = PlayVideoFrom.youtube(video.videoUrl);
        break;
      case VideoSourceType.vimeo:
        videoSource = PlayVideoFrom.vimeo(_extractVimeoVideoId(video.videoUrl)!);
        break;
      case VideoSourceType.network:
        videoSource = PlayVideoFrom.network(video.videoUrl);
        break;
    }

    playerController = PodPlayerController(

      playVideoFrom: videoSource,

      podPlayerConfig: const PodPlayerConfig(
          autoPlay: true, isLooping: false, videoQualityPriority: [720, 360],


      ),
    )..initialise().then((_) {
        _isInitialized = true;
        notifyListeners();
        _setupListeners();
      });
  }

  void _setupListeners() {
    playerController.addListener(() {
      if (playerController.currentVideoPosition >=
          playerController.totalVideoLength) {
        onVideoComplete();
      }
    });
  }

  void playNext() {
    if (_currentIndex < playlist.length - 1) {
      _currentIndex++;
      _switchVideo();
    }
  }

  void playPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _switchVideo();
    }
  }

  void playAt(int index) {
    if (index >= 0 && index < playlist.length) {
      _currentIndex = index;
      _switchVideo();
    }
  }

  void onVideoComplete() {
    if (_currentIndex < playlist.length - 1) {
      playNext();
    }
  }

  void _switchVideo() {
    playerController.dispose();
    _isInitialized = false;
    notifyListeners();
    _setupPlayer(playlist[_currentIndex]);
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }
  String? _extractVimeoVideoId(String url) {
    final regex = RegExp(r'vimeo\.com/(?:.*#|.*/videos?/|)(\d+)');
    final match = regex.firstMatch(url);

    if (match != null && match.groupCount >= 1) {
      return match.group(1);
    }

    return null;
  }
}
