import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lottie/lottie.dart';
import 'package:math_app/core/network/urls.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_html.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/model/course/lesson_dto.dart';
import '../manager/lessons/lesson_bloc.dart';

@RoutePage()
class LessonScreen extends StatefulWidget {
  final LessonDto lessonDto;

  const LessonScreen({
    super.key,
    required this.lessonDto,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  LessonBloc lessonBloc = LessonBloc();
  YoutubePlayerController? youtubePlayerController;
  VideoPlayerController? videoPlayerController;

  // WebViewController? controller;
  InAppWebViewController? controller;

  @override
  void initState() {
    super.initState();

    if (widget.lessonDto.id != null) {
      lessonBloc.add(LoadLesson(lessonId: widget.lessonDto.id!));
    }
  }

  @override
  void dispose() {
    if (youtubePlayerController != null) {
      youtubePlayerController!.dispose();
    }
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }
    super.dispose();
  }

  bool showVideo = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: lessonBloc,
      child: BlocListener<LessonBloc, LessonState>(
        listener: (context, state) {
          if (state is LessonLoaded &&
              state.lessonDto.videos != null &&
              state.lessonDto.videos!.isNotEmpty) {
            showVideo = true;
            final video = state.lessonDto.videos![state.activeVideoIndex];

            if (video.status == "youtube") {
              if (youtubePlayerController == null) {
                final videoId = YoutubePlayer.convertUrlToId(video.fileUrl!);

                youtubePlayerController = YoutubePlayerController(
                  initialVideoId: videoId!,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                    hideThumbnail: true,
                    forceHD: true,
                  ),
                );
              } else {
                final video = state.lessonDto.videos![state.activeVideoIndex];

                if (video.status == "youtube") {
                  final videoId = YoutubePlayer.convertUrlToId(video.fileUrl!);
                  youtubePlayerController!.load(videoId!);
                }
              }
            } else if (video.status == "main") {
              if (youtubePlayerController != null) {
                youtubePlayerController!.dispose();
                youtubePlayerController = null;
              }
            } else {
              showVideo = false;
            }
          }
        },
        child: BlocBuilder<LessonBloc, LessonState>(
          builder: (context, state) {
            if (state is LessonLoading) {
              return SafeArea(
                child: const Scaffold(
                  backgroundColor: AppColors.white,
                  body: Center(
                    child: WLoader(),
                  ),
                ),
              );
            } else if (state is LessonLoaded) {
              if (showVideo) {
                String? status =
                    state.lessonDto.videos?[state.activeVideoIndex].status;

                if (status != null &&
                    status == "youtube" &&
                    youtubePlayerController != null) {
                  return YoutubePlayerBuilder(
                    player: YoutubePlayer(controller: youtubePlayerController!),
                    builder: (context, player) {
                      return _getLessonWidget(child: player, state: state);
                    },
                  );
                } else if (status != null && status == "main") {
                  return _getLessonWidget(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: InAppWebView(
                          onReceivedHttpError: (controller, request, error) {
                            setState(() {
                              showVideo = false;
                            });
                          },
                          initialUrlRequest: URLRequest(
                            url: WebUri.uri(
                              Uri.parse(
                                  "${Urls.pageUrl}/play?hls-id=${state.lessonDto.videos![state.activeVideoIndex].id!}"),
                            ),
                          ),
                          initialSettings: InAppWebViewSettings(
                            disableContextMenu: true,
                            cacheMode: CacheMode.LOAD_CACHE_ELSE_NETWORK,
                            minimumZoomScale: 1,
                            maximumZoomScale: 1,
                            horizontalScrollBarEnabled: false,
                          ),
                          onReceivedError: (controller, request, error) {
                            setState(() {
                              showVideo = false;
                            });
                          },
                          onEnterFullscreen: (controller) async {
                            await SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeRight,
                              DeviceOrientation.landscapeLeft,
                            ]);
                          },
                          onExitFullscreen: (controller) async {
                            await SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitDown,
                              DeviceOrientation.portraitUp,
                              DeviceOrientation.landscapeRight,
                              DeviceOrientation.landscapeLeft,
                            ]);
                          },
                        ),
                      ),
                      state: state);
                }
              }
              return _getLessonWidget(state: state);
            } else if (state is LessonError) {
              return Scaffold(
                backgroundColor: AppColors.white,
                body: Center(
                  child: Column(
                    children: [
                      Text(state.message),
                      if (widget.lessonDto.id != null) ...{
                        WButton(
                          text: 'Qayta boshlash',
                          onTap: () {
                            lessonBloc.add(
                                LoadLesson(lessonId: widget.lessonDto.id!));
                          },
                        ),
                      }
                    ],
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  _getLessonWidget({Widget? child, required LessonLoaded state}) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.white,
              titleSpacing: 0,
              floating: true,
              title: Text(
                widget.lessonDto.title ?? "?title",
                style: TextStyle(fontSize: 16),
              ),
            ),
            if (child != null) ...{
              SliverToBoxAdapter(
                child: child,
              ),
            },
            if (state.lessonDto.videos != null &&
                state.lessonDto.videos!.length > 1) ...{
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.lessonDto.videos!.length,
                  (_, index) => GestureDetector(
                    onTap: () {
                      if (state.activeVideoIndex != index) {
                        lessonBloc.add(SelectVideo(videoIndex: index));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: state.activeVideoIndex == index
                            ? BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 0,
                                    blurRadius: 15,
                                    offset: const Offset(0, 10),
                                    color: Colors.black.withOpacity(0.05),
                                  ),
                                ],
                              )
                            : null,
                        child: Row(
                          children: [
                            if (index == state.activeVideoIndex) ...{
                              Lottie.asset(
                                "assets/lottie/playing.json",
                                width: 24,
                              ),
                            } else ...{
                              const Icon(
                                Icons.play_circle,
                                color: AppColors.grey,
                              ),
                            },
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                state.lessonDto.videos![index].name ??
                                    "?video name",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: index == state.activeVideoIndex
                                      ? AppColors.primaryColor
                                      : AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            },
            if (state.lessonDto.description != null &&
                state.lessonDto.description != '') ...{
              const SliverToBoxAdapter(
                child: Divider(
                  color: AppColors.C_CACACA,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: WHtml(htmlContent: state.lessonDto.description!)),
              ),
            },
          ],
        ),
      );
}
