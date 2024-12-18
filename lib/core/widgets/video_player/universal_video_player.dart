import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_pod_player/last_pod_player.dart';
import 'package:math_app/config/routes/route_data.dart';
import 'package:math_app/core/extensions/video_type_ext.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/widgets/video_player/video_player_ctrl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UniversalVideoPlayer extends StatefulWidget {
  final VideoController controller;

  const UniversalVideoPlayer({Key? key, required this.controller})
      : super(key: key);

  @override
  State<UniversalVideoPlayer> createState() => _UniversalVideoPlayerState();
}

class _UniversalVideoPlayerState extends State<UniversalVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<VideoController>(
      valueListenable: widget.controller,
      builder: (context, controller, _) {
        if (controller.playlist.isEmpty) {
          return const Center(
              child: Text("Video formati qo'llab-quvvatlanmaydi"));
        }

        final videoType = controller.currentVideo?.videoUrl.videoType;
        final player = controller.currentPlayer;

        if (videoType == VideoSourceType.youtube &&
            player is YoutubePlayerController) {
          return YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: player,
                showVideoProgressIndicator: true,
              ),
              onEnterFullScreen: () {
                // Fullscreen rejimga kirganda landscape qilish
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              },
              onExitFullScreen: () {
                // Fullscreen rejimdan chiqqanda portret rejimga qaytarish
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              },
              builder: (context, plr) {
                return stackedAppBar(
                  isPortrait: !player.value.isFullScreen,
                  child: GestureDetector(
                    onTap: () {
                      player.flags.copyWith(hideControls: false);
                      player.value.copyWith(isControlsVisible: true);
                    },
                    child: plr,
                  ),
                );
              });
        } else if ((videoType == VideoSourceType.vimeo ||
                videoType == VideoSourceType.network) &&
            player is PodPlayerController) {
          return stackedAppBar(
            isPortrait: true,
            child: PodVideoPlayer(
              controller: player,
            ),
          );
        } else {
          return const Center(
              child: Text("Video formati qo'llab-quvvatlanmaydi"));
        }
      },
    );
  }

  Widget stackedAppBar({required bool isPortrait, required Widget child}) =>
      Stack(

        children: [
          child,
          if (isPortrait)
            Positioned.fill(
              top: 40,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){context.router.maybePop();},
                      child: SvgPicture.asset(
                        AppIcons.arrowDown,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SvgPicture.asset(
                          AppIcons.dots,
                        ),
                        const SizedBox(width: 16,),
                        SvgPicture.asset(
                          AppIcons.close,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

        ],
      );
}
