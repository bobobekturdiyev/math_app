import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:last_pod_player/last_pod_player.dart';
import 'package:math_app/core/extensions/video_type_ext.dart';
import 'package:math_app/core/shared/domain/shared_entities/lesson_entity.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
enum VideoSourceType { youtube, vimeo, network }

class VideoController extends ChangeNotifier implements ValueListenable<VideoController> {
  final List<LessonEntity> playlist;
  late dynamic currentPlayer;
  int _currentIndex = 0;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  int get currentIndex => _currentIndex;

  LessonEntity? get currentVideo => playlist[_currentIndex];

  // Callback for video end
  void Function(LessonEntity video, int index)? onVideoEnded;

  VideoController({required this.playlist}) {
    if (playlist.isNotEmpty) {
      _initializePlayer();
    }
  }

  void _initializePlayer() {
    _setupPlayer(playlist[_currentIndex]);
  }

  void _setupPlayer(LessonEntity video) {
    if (video.videoUrl.videoType == VideoSourceType.youtube) {
      currentPlayer = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(video.videoUrl)!,
        flags: const YoutubePlayerFlags(autoPlay: true,),
      )..addListener(_youtubeListener);
    } else {
      final PlayVideoFrom source = video.videoUrl.videoType == VideoSourceType.vimeo
          ? PlayVideoFrom.vimeo(_extractVimeoVideoId(video.videoUrl)!)
          : PlayVideoFrom.network(video.videoUrl);

      currentPlayer = PodPlayerController(
        playVideoFrom: source,
        podPlayerConfig: const PodPlayerConfig(autoPlay: true, isLooping: false),
      )..initialise().then((_) {
        _isInitialized = true;
        notifyListeners();
        _setupPodListeners();
      });
    }


  }

  void _setupPodListeners() {
    if (currentPlayer is PodPlayerController) {
      (currentPlayer as PodPlayerController).addListener(() {
        if (currentPlayer.currentVideoPosition >= currentPlayer.totalVideoLength) {
          _onVideoEnd();
        }
      });
    }
  }

  void _youtubeListener() {
    if (currentPlayer is YoutubePlayerController) {
      final youtubeController = currentPlayer as YoutubePlayerController;

      if (youtubeController.value.playerState == PlayerState.ended) {
        _onVideoEnd();
      }
    }
  }

  void _onVideoEnd() {
    onVideoEnded?.call(currentVideo!, _currentIndex);
    playNext();
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

  void _switchVideo() {
    if (currentPlayer is PodPlayerController || currentPlayer is YoutubePlayerController) {
      final playerToDispose = currentPlayer;
      Future.microtask(() {
        playerToDispose.dispose();
      });
    }

    _isInitialized = false;
    notifyListeners();

    _setupPlayer(playlist[_currentIndex]);
  }


  String? _extractVimeoVideoId(String url) {
    final regex = RegExp(r'vimeo\.com/(?:.*#|.*/videos?/|)(\d+)');
    final match = regex.firstMatch(url);
    return match?.group(1);
  }

  @override
  void dispose() {
    if (currentPlayer is PodPlayerController || currentPlayer is YoutubePlayerController) {
      currentPlayer.dispose();
    }
    super.dispose();
  }

  @override
  VideoController get value => this;
}
