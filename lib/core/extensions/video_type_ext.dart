import 'package:math_app/core/widgets/video_player/universal_video_player.dart';
import 'package:math_app/core/widgets/video_player/video_player_ctrl.dart';

class VideoUrlAnalyzer {
  static VideoSourceType detectVideoType(String url) {
    // YouTube URL patterns
    final youtubePatterns = [
      r'^https?:\/\/(?:www\.)?youtube\.com\/watch\?v=([^&]+)',
      r'^https?:\/\/(?:www\.)?youtube\.com\/embed\/([^?]+)',
      r'^https?:\/\/youtu\.be\/([^?]+)',
      r'^https?:\/\/(?:www\.)?youtube\.com\/shorts\/([^?]+)',
    ];

    // Vimeo URL patterns
    final vimeoPatterns = [
      r'^https?:\/\/(?:www\.)?vimeo\.com\/(\d+)',
      r'^https?:\/\/(?:www\.)?player\.vimeo\.com\/video\/(\d+)',
    ];

    // MP4 and other video file patterns
    final mp4Patterns = [
      r'\.mp4$',
      r'\.m4v$',
      r'\.mov$',
      r'\.webm$',
    ];

    // Check YouTube patterns
    for (var pattern in youtubePatterns) {
      if (RegExp(pattern).hasMatch(url)) {
        return VideoSourceType.youtube;
      }
    }

    // Check Vimeo patterns
    for (var pattern in vimeoPatterns) {
      if (RegExp(pattern).hasMatch(url)) {
        return VideoSourceType.vimeo;
      }
    }

    // Check MP4 and other video file patterns
    for (var pattern in mp4Patterns) {
      if (RegExp(pattern).hasMatch(url)) {
        return VideoSourceType.network;
      }
    }

    // If URL contains specific domains
    if (url.contains('youtube') || url.contains('youtu.be')) {
      return VideoSourceType.youtube;
    }
    if (url.contains('vimeo')) {
      return VideoSourceType.vimeo;
    }

    // Default to MP4 if no other matches
    return VideoSourceType.network;
  }

  static String? extractVideoId(String url, VideoSourceType type) {
    switch (type) {
      case VideoSourceType.youtube:
      // YouTube ID extraction patterns
        final patterns = [
          r'^https?:\/\/(?:www\.)?youtube\.com\/watch\?v=([^&]+)',
          r'^https?:\/\/(?:www\.)?youtube\.com\/embed\/([^?]+)',
          r'^https?:\/\/youtu\.be\/([^?]+)',
          r'^https?:\/\/(?:www\.)?youtube\.com\/shorts\/([^?]+)',
        ];

        for (var pattern in patterns) {
          final match = RegExp(pattern).firstMatch(url);
          if (match != null && match.groupCount >= 1) {
            return match.group(1);
          }
        }
        return null;

      case VideoSourceType.vimeo:
      // Vimeo ID extraction patterns
        final patterns = [
          r'^https?:\/\/(?:www\.)?vimeo\.com\/(\d+)',
          r'^https?:\/\/(?:www\.)?player\.vimeo\.com\/video\/(\d+)',
        ];

        for (var pattern in patterns) {
          final match = RegExp(pattern).firstMatch(url);
          if (match != null && match.groupCount >= 1) {
            return match.group(1);
          }
        }
        return null;

      case VideoSourceType.network:
      // For MP4, return the full URL
        return url;
    }
  }
}

// Extension method for easy use
extension VideoUrlExtension on String {
  VideoSourceType get videoType => VideoUrlAnalyzer.detectVideoType(this);
  String? get videoId => VideoUrlAnalyzer.extractVideoId(this, this.videoType);
}