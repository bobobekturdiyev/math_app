import 'package:flutter/material.dart';
import 'package:math_app/core/shared_entities/lesson_entity.dart';
import 'package:math_app/core/widgets/video_player/video_player_ctrl.dart';
import 'package:pod_player/pod_player.dart';
import 'package:provider/provider.dart';

enum VideoSourceType { youtube, vimeo, network }

class VideoItem {
  final String id;
  final String title;
  final String url;
  final VideoSourceType type;
  final String? thumbnail;
  final String? duration;
  final bool isCompleted;
  final double watchedPercentage;

  VideoItem({
    required this.id,
    required this.title,
    required this.url,
    required this.type,
    this.thumbnail,
    this.duration,
    this.isCompleted = false,
    this.watchedPercentage = 0,
  });
}

class UniversalVideoPlayer extends StatelessWidget {
  final VideoController controller;
  final Function( LessonEntity current) onCompleted;


  const UniversalVideoPlayer({Key? key, required this.controller, required this.onCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Column(
        children: [
          // Video Player
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Consumer<VideoController>(
              builder: (context, controller, _) {
                if(controller.playerController.currentVideoPosition >=
                    controller. playerController.totalVideoLength){
                  onCompleted(controller.currentVideo);
                }
                return 
                  controller.playlist.isNotEmpty?
                  PodVideoPlayer(
                  controller: controller.playerController,
                  // podProgressBarConfig: const PodProgressBarConfig(
                  //   playingBarColor: Colors.green,
                  //   circleHandlerColor: Colors.green,
                  //   backgroundColor: Colors.grey,
                  //
                  // ),

                  // overlayBuilder: (state) {
                  //   // if (!state.isOverlayVisible) {
                  //   //   return const SizedBox(); // kontrollar ko'rinmaganda bo'sh widget
                  //   // }
                  //
                  //   return AnimatedOpacity(
                  //     duration: const Duration(milliseconds: 200),
                  //     opacity: state.isOverlayVisible ? 1 : 0,
                  //     child: Stack(
                  //       fit: StackFit.passthrough,
                  //       children: [
                  //         MobileOverlay(state: state,)
                  //       ],
                  //     ),
                  //   );
                  // },
                ):Center(child: Text("Darslar topilmadi"),);
              },
            ),
          ),
          // Controls
        ],
      ),
    );
  }
}



