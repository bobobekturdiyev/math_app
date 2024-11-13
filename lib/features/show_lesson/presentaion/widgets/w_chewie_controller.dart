import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:video_player/video_player.dart';

import '../../../../config/routes/route_path.dart';

class WChewiePlayer extends StatefulWidget {
  final String url;
  final bool isOpen;

  const WChewiePlayer({Key? key, required this.url, required this.isOpen})
      : super(key: key);

  @override
  State<WChewiePlayer> createState() => _WChewiePlayerState();
}

class _WChewiePlayerState extends State<WChewiePlayer> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    _initPlayer();
    super.initState();
  }

  void _initPlayer() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url))..initialize();
    chewieController = ChewieController(
      // autoPlay: true,
      looping: true,

      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.isOpen
        ? Center(
            child: WButton(
                text: "Kursga ulansih",
                onTap: () {
                  context.router.pushNamed(RoutePath.plan);
                }),
          )
        : AspectRatio(
            aspectRatio: 16 / 9,
            child: Chewie(
              controller: chewieController!,
            ),
          );
  }
}
