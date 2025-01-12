import 'package:flutter/material.dart';
import 'package:math_app/features/home/data/model/course/lesson_dto.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WVideoPage extends StatefulWidget {
  final LessonDto lesson;

  const WVideoPage({super.key, required this.lesson});

  @override
  State<WVideoPage> createState() => _WVideoPageState();
}

class _WVideoPageState extends State<WVideoPage> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    final video = widget.lesson.videos!.first;

    if (video.status == 'youtube') {
      final videoId = YoutubePlayer.convertUrlToId(video.fileUrl!);

      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          hideThumbnail: true,
          forceHD: true,
        ),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (ctx, player) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          player,
          Text("VIdeo yuklandi tepada"),
        ],
      ),
    );
  }
}
