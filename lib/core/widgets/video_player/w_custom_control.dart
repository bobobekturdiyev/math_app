//
// import 'package:flutter/material.dart';
// import 'package:math_app/core/widgets/video_player/video_player_ctrl.dart';
// import 'package:pod_player/pod_player.dart';
// import 'package:provider/provider.dart';
//
// class MobileOverlay extends StatelessWidget {
//   final OverLayOptions state;
//
//   MobileOverlay({super.key, required this.state});
//
//   String tag = UniqueKey().toString();
//
//   @override
//   Widget build(BuildContext context) {
//     const overlayColor = Colors.black38;
//     const itemColor = Colors.white;
//     return Consumer<VideoController>(
//       builder: (context, controller, _) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             _VideoGestureDetector(
//               tag: tag,
//               onTap: () {
//                 state.isOverlayVisible
//                     ? controller.playerController.hideOverlay()
//                     : controller.playerController.showOverlay();
//               },
//               child: ColoredBox(
//                 color: overlayColor,
//                 child: Row(
//                   children: [
//                     // Expanded(
//                     //   child: DoubleTapIcon(
//                     //     tag: tag,
//                     //     isForward: false,
//                     //     height: double.maxFinite,
//                     //     onDoubleTap: _isRtl()
//                     //         ? controller.playerController.o
//                     //         : podCtr.onLeftDoubleTap,
//                     //   ),
//                     // ),
//                     SizedBox(
//                       height: double.infinity,
//                       child: Center(
//                         child: _AnimatedPlayPauseIcon(
//                           tag: tag,
//                           size: 42,
//                           state: state,
//                           controller: controller,
//                         ),
//                       ),
//                     ),
//                     // Expanded(
//                     //   child: DoubleTapIcon(
//                     //     isForward: true,
//                     //     tag: tag,
//                     //     height: double.maxFinite,
//                     //     onDoubleTap: _isRtl()
//                     //         ? controller.onLeftDoubleTap
//                     //         : podCtr.onRightDoubleTap,
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   // Expanded(
//                   //   child: IgnorePointer(
//                   //     child: controller. ?? const SizedBox(),
//                   //   ),
//                   // ),
//                   MaterialIconButton(
//                     toolTipMesg: "Assalomu alaykum",
//                     color: itemColor,
//                     onPressed: () {
//                       if (state.isOverlayVisible) {
//                         // _bottomSheet(context);
//                       } else {
//                         controller.playerController.showOverlay();
//                       }
//                     },
//                     child: const Icon(
//                       Icons.more_vert_rounded,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: _MobileOverlayBottomControlles(tag: tag, state: state,),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   bool _isRtl() {
//     final Locale locale = WidgetsBinding.instance.platformDispatcher.locale;
//     final langs = [
//       'ar', // Arabic
//       'fa', // Farsi
//       'he', // Hebrew
//       'ps', // Pashto
//       'ur', // Urdu
//     ];
//     for (int i = 0; i < langs.length; i++) {
//       final lang = langs[i];
//       if (locale.toString().contains(lang)) {
//         return true;
//       }
//     }
//     return false;
//   }
//
// // void _bottomSheet(BuildContext context) {
// //   showModalBottomSheet<void>(
// //     context: context,
// //     builder: (context) => SafeArea(child: _MobileBottomSheet(tag: tag)),
// //   );
// // }
// }
//
// class _AnimatedPlayPauseIcon extends StatefulWidget {
//   final double? size;
//   final String tag;
//   final OverLayOptions state;
//   final VideoController controller;
//
//   const _AnimatedPlayPauseIcon({
//     required this.tag,
//     this.size,
//     required this.state,
//     required this.controller,
//   });
//
//   @override
//   State<_AnimatedPlayPauseIcon> createState() => _AnimatedPlayPauseIconState();
// }
//
// class _AnimatedPlayPauseIconState extends State<_AnimatedPlayPauseIcon>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _payCtr;
//
//   @override
//   void initState() {
//     _payCtr = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 450),
//     );
//     // _podCtr.addListenerId('podVideoState', playPauseListner);
//     if (widget.controller.playerController.isVideoPlaying) {
//       if (mounted) _payCtr.forward();
//     }
//     super.initState();
//   }
//
//   void playPauseListner() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       if (widget.state.podVideoState == PodVideoState.playing) {
//         if (mounted) _payCtr.forward();
//       }
//       if (widget.state.podVideoState == PodVideoState.paused) {
//         if (mounted) _payCtr.reverse();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _payCtr.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<VideoController>(
//       builder: (context, controller, _) {
//         return MaterialIconButton(
//           toolTipMesg: "Hey",
//           onPressed: widget.state.isOverlayVisible
//               ? controller.playerController.togglePlayPause
//               : null,
//           child: onStateChange(widget.state.podVideoState),
//         );
//       },
//     );
//   }
//
//   Widget onStateChange(PodVideoState state) {
//     if (state == PodVideoState.loading) {
//       return const SizedBox();
//     } else {
//       return _playPause();
//     }
//   }
//
//   Widget _playPause() {
//     return AnimatedIcon(
//       icon: AnimatedIcons.play_pause,
//       progress: _payCtr,
//       color: Colors.white,
//       size: widget.size,
//     );
//   }
// }
//
// class _VideoGestureDetector extends StatelessWidget {
//   final Widget? child;
//   final void Function()? onDoubleTap;
//   final void Function()? onTap;
//   final String tag;
//
//   const _VideoGestureDetector({
//     required this.tag,
//     this.child,
//     this.onDoubleTap,
//     this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       onDoubleTap: onDoubleTap,
//       child: child,
//     );
//   }
// }
//
// // class DoubleTapIcon extends StatefulWidget {
// //   final void Function() onDoubleTap;
// //   final String tag;
// //   final bool iconOnly;
// //   final bool isForward;
// //   final double height;
// //   final double? width;
// //
// //   const DoubleTapIcon({
// //     required this.onDoubleTap,
// //     required this.tag,
// //     required this.isForward,
// //     super.key,
// //     this.iconOnly = false,
// //     this.height = 50,
// //     this.width,
// //   });
// //
// //   @override
// //   State<DoubleTapIcon> createState() => _DoubleTapIconState();
// // }
// //
// // class _DoubleTapIconState extends State<DoubleTapIcon>
// //     with SingleTickerProviderStateMixin {
// //   late final AnimationController _animationController;
// //   late final Animation<double> opacityCtr;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 200),
// //     );
// //     opacityCtr = Tween<double>(begin: 0, end: 1).animate(
// //       CurvedAnimation(
// //         parent: _animationController,
// //         curve: Curves.easeInOut,
// //       ),
// //     );
// //     final podCtr = Get.find<PodGetXVideoController>(tag: widget.tag);
// //     if (widget.iconOnly && !widget.isForward) {
// //       podCtr.addListenerId('double-tap-left', _onDoubleTap);
// //     }
// //     if (widget.iconOnly && widget.isForward) {
// //       podCtr.addListenerId('double-tap-right', _onDoubleTap);
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     final podCtr = Get.find<PodGetXVideoController>(tag: widget.tag);
// //
// //     if (widget.iconOnly && !widget.isForward) {
// //       podCtr.removeListenerId('double-tap-left', _onDoubleTap);
// //     }
// //     if (widget.iconOnly && widget.isForward) {
// //       podCtr.removeListenerId('double-tap-right', _onDoubleTap);
// //     }
// //     _animationController.dispose();
// //     super.dispose();
// //   }
// //
// //   void _onDoubleTap() {
// //     widget.onDoubleTap();
// //     _animationController.forward().then((_) {
// //       _animationController.reverse();
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     if (widget.iconOnly) return iconWithText();
// //     return DoubleTapRippleEffect(
// //       onDoubleTap: _onDoubleTap,
// //       rippleColor: Colors.white,
// //       wrapper: (parentWidget, curveRadius) {
// //         final forwardRadius =
// //             !widget.isForward ? Radius.zero : Radius.circular(curveRadius);
// //         final backwardRadius =
// //             widget.isForward ? Radius.zero : Radius.circular(curveRadius);
// //         return ClipRRect(
// //           borderRadius: BorderRadius.only(
// //             bottomLeft: forwardRadius,
// //             topLeft: forwardRadius,
// //             bottomRight: backwardRadius,
// //             topRight: backwardRadius,
// //           ),
// //           child: parentWidget,
// //         );
// //       },
// //       child: iconWithText(),
// //     );
// //   }
// //
// //   SizedBox iconWithText() {
// //     return SizedBox(
// //       height: widget.height,
// //       width: widget.width,
// //       child: AnimatedBuilder(
// //         animation: _animationController,
// //         builder: (context, child) {
// //           const icon = Icon(
// //             Icons.play_arrow_sharp,
// //             size: 32,
// //             color: Colors.white,
// //           );
// //           return Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 RotatedBox(
// //                   quarterTurns: widget.isForward ? 0 : 2,
// //                   child: Stack(
// //                     children: [
// //                       AnimatedOpacity(
// //                         duration: const Duration(milliseconds: 200),
// //                         opacity: opacityCtr.value,
// //                         child: icon,
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 20),
// //                         child: AnimatedOpacity(
// //                           duration: const Duration(milliseconds: 300),
// //                           opacity: opacityCtr.value,
// //                           child: icon,
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 40),
// //                         child: AnimatedOpacity(
// //                           duration: const Duration(milliseconds: 600),
// //                           opacity: opacityCtr.value,
// //                           child: icon,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 GetBuilder<PodGetXVideoController>(
// //                   tag: widget.tag,
// //                   id: 'double-tap',
// //                   builder: (podCtr) {
// //                     if (widget.isForward && podCtr.isRightDbTapIconVisible) {
// //                       return AnimatedOpacity(
// //                         duration: const Duration(milliseconds: 300),
// //                         opacity: opacityCtr.value,
// //                         child: Text(
// //                           '${podCtr.isLeftDbTapIconVisible ? podCtr.leftDoubleTapduration : podCtr.rightDubleTapduration} Sec',
// //                           style: const TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       );
// //                     }
// //                     if (!widget.isForward && podCtr.isLeftDbTapIconVisible) {
// //                       return AnimatedOpacity(
// //                         duration: const Duration(milliseconds: 300),
// //                         opacity: opacityCtr.value,
// //                         child: Text(
// //                           '${podCtr.isLeftDbTapIconVisible ? podCtr.leftDoubleTapduration : podCtr.rightDubleTapduration} Sec',
// //                           style: const TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       );
// //                     }
// //                     return const SizedBox();
// //                   },
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
//
// class MaterialIconButton extends StatelessWidget {
//   const MaterialIconButton({
//     required this.child,
//     required this.toolTipMesg,
//     super.key,
//     this.color,
//     this.radius = 12,
//     this.onPressed,
//     this.onHover,
//     this.onTapDown,
//   });
//
//   final Color? color;
//   final Widget child;
//   final double radius;
//   final String toolTipMesg;
//   final void Function()? onPressed;
//   final void Function(bool)? onHover;
//   final void Function(TapDownDetails details)? onTapDown;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       type: MaterialType.transparency,
//       shape: const CircleBorder(),
//       child: Tooltip(
//         message: toolTipMesg,
//         // textStyle: TextStyle(fontSize: 0.01),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(radius * 4),
//           onHover: onHover,
//           onTap: onPressed,
//           onTapDown: onTapDown,
//           child: Padding(
//             padding: EdgeInsets.all(radius),
//             child: IconTheme(
//               data: IconThemeData(color: color, size: 24),
//               child: child,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class _MobileBottomSheet extends StatelessWidget {
// //   final String tag;
// //
// //   const _MobileBottomSheet({
// //     required this.tag,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetBuilder<PodGetXVideoController>(
// //       tag: tag,
// //       builder: (podCtr) => Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           if (podCtr.vimeoOrVideoUrls.isNotEmpty)
// //             _bottomSheetTiles(
// //               title: podCtr.podPlayerLabels.quality,
// //               icon: Icons.video_settings_rounded,
// //               subText: '${podCtr.vimeoPlayingVideoQuality}p',
// //               onTap: () {
// //                 Navigator.of(context).pop();
// //                 Timer(const Duration(milliseconds: 100), () {
// //                   showModalBottomSheet<void>(
// //                     context: context,
// //                     builder: (context) => SafeArea(
// //                       child: _VideoQualitySelectorMob(
// //                         tag: tag,
// //                         onTap: null,
// //                       ),
// //                     ),
// //                   );
// //                 });
// //                 // await Future.delayed(
// //                 //   const Duration(milliseconds: 100),
// //                 // );
// //               },
// //             ),
// //           _bottomSheetTiles(
// //             title: podCtr.podPlayerLabels.loopVideo,
// //             icon: Icons.loop_rounded,
// //             subText: podCtr.isLooping
// //                 ? podCtr.podPlayerLabels.optionEnabled
// //                 : podCtr.podPlayerLabels.optionDisabled,
// //             onTap: () {
// //               Navigator.of(context).pop();
// //               podCtr.toggleLooping();
// //             },
// //           ),
// //           _bottomSheetTiles(
// //             title: podCtr.podPlayerLabels.playbackSpeed,
// //             icon: Icons.slow_motion_video_rounded,
// //             subText: podCtr.currentPaybackSpeed,
// //             onTap: () {
// //               Navigator.of(context).pop();
// //               Timer(const Duration(milliseconds: 100), () {
// //                 showModalBottomSheet<void>(
// //                   context: context,
// //                   isScrollControlled: true,
// //                   builder: (context) => SafeArea(
// //                     child: _VideoPlaybackSelectorMob(
// //                       tag: tag,
// //                       onTap: null,
// //                     ),
// //                   ),
// //                 );
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   ListTile _bottomSheetTiles({
// //     required String title,
// //     required IconData icon,
// //     String? subText,
// //     void Function()? onTap,
// //   }) {
// //     return ListTile(
// //       leading: Icon(icon),
// //       onTap: onTap,
// //       title: FittedBox(
// //         fit: BoxFit.scaleDown,
// //         alignment: Alignment.centerLeft,
// //         child: Row(
// //           children: [
// //             Text(
// //               title,
// //             ),
// //             if (subText != null) const SizedBox(width: 6),
// //             if (subText != null)
// //               const SizedBox(
// //                 height: 4,
// //                 width: 4,
// //                 child: DecoratedBox(
// //                   decoration: BoxDecoration(
// //                     color: Colors.grey,
// //                     shape: BoxShape.circle,
// //                   ),
// //                 ),
// //               ),
// //             if (subText != null) const SizedBox(width: 6),
// //             if (subText != null)
// //               Text(
// //                 subText,
// //                 style: const TextStyle(color: Colors.grey),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // class _VideoQualitySelectorMob extends StatelessWidget {
// //   final void Function()? onTap;
// //   final String tag;
// //
// //   const _VideoQualitySelectorMob({
// //     required this.onTap,
// //     required this.tag,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final podCtr = Get.find<PodGetXVideoController>(tag: tag);
// //     return SingleChildScrollView(
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: podCtr.vimeoOrVideoUrls
// //             .map(
// //               (e) => ListTile(
// //                 title: Text('${e.quality}p'),
// //                 onTap: () {
// //                   onTap != null ? onTap!() : Navigator.of(context).pop();
// //
// //                   podCtr.changeVideoQuality(e.quality);
// //                 },
// //               ),
// //             )
// //             .toList(),
// //       ),
// //     );
// //   }
// // }
// //
// // class _VideoPlaybackSelectorMob extends StatelessWidget {
// //   final void Function()? onTap;
// //   final String tag;
// //
// //   const _VideoPlaybackSelectorMob({
// //     required this.onTap,
// //     required this.tag,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final podCtr = Get.find<PodGetXVideoController>(tag: tag);
// //     return SingleChildScrollView(
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: podCtr.videoPlaybackSpeeds
// //             .map(
// //               (e) => ListTile(
// //                 title: Text(e),
// //                 onTap: () {
// //                   onTap != null ? onTap!() : Navigator.of(context).pop();
// //                   podCtr.setVideoPlayBack(e);
// //                 },
// //               ),
// //             )
// //             .toList(),
// //       ),
// //     );
// //   }
// // }
// //
// class _MobileOverlayBottomControlles extends StatelessWidget {
//   final String tag;
//   final OverLayOptions state;
//
//   const _MobileOverlayBottomControlles({
//     required this.tag,
//     required this.state,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     const durationTextStyle = TextStyle(color: Colors.white70);
//     const itemColor = Colors.white;
//     return Consumer<VideoController>(
//       builder: (context, controller, _) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 const SizedBox(width: 12),
//                 Row(
//                   children: [
//                     Text(
//                       controller.playerController.currentVideoPosition
//                           .toString(),
//                       style: const TextStyle(color: itemColor),
//                     ),
//                     const Text(
//                       ' / ',
//                       style: durationTextStyle,
//                     ),
//                     Text(
//                       controller.playerController.totalVideoLength.toString(),
//                       style: durationTextStyle,
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 MaterialIconButton(
//
//                   color: itemColor,
//                   onPressed: () {
//                     if (state.isOverlayVisible) {
//                       if (controller.playerController.isFullScreen) {
//                         controller.playerController.disableFullScreen(context);
//                       } else {
//                         controller.playerController.enableFullScreen();
//                       }
//                     } else {
//                       if (state.isOverlayVisible) {
//                       } else {
//                         controller.playerController.hideOverlay();
//                       }
//                       controller.playerController.showOverlay();
//                     }
//                   },
//                   toolTipMesg: 'Hey men Ful screnman',
//                   child: Icon(
//                     controller.playerController.isFullScreen
//                         ? Icons.fullscreen_exit
//                         : Icons.fullscreen,
//                   ),
//                 ),
//               ],
//             ),
//             if (state.isFullScreen) ...{
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
//                 child: Visibility(
//                   visible: state.isOverlayVisible,
//                   child: PodProgressBar(
//                     tag: tag,
//                     alignment: Alignment.topCenter,
//           state: state, controller: controller,
//                   ),
//                 ),
//               ),
//             } else ...{
//               PodProgressBar(
//                 tag: tag,
//                 alignment: Alignment.bottomCenter,
//         state: state, controller: controller,
//               ),
//             }
//           ],
//         );
//       },
//     );
//   }
// }
//
//
//
// /// Renders progress bar for the video using custom paint.
// class PodProgressBar extends StatefulWidget {
//   const PodProgressBar({
//     required this.tag,
//     super.key,
//     PodProgressBarConfig? podProgressBarConfig,
//     this.onDragStart,
//     this.onDragEnd,
//     this.onDragUpdate,
//     this.alignment = Alignment.center, required this.state, required this.controller,
//   }) : podProgressBarConfig =
//       podProgressBarConfig ?? const PodProgressBarConfig();
// final OverLayOptions state;
// final VideoController controller;
//   final PodProgressBarConfig podProgressBarConfig;
//   final void Function()? onDragStart;
//   final void Function()? onDragEnd;
//   final void Function()? onDragUpdate;
//   final Alignment alignment;
//   final String tag;
//
//   @override
//   State<PodProgressBar> createState() => _PodProgressBarState();
// }
//
// class _PodProgressBarState extends State<PodProgressBar> {
//   late VideoPlayerValue? videoPlayerValue = widget.controller.playerController.videoPlayerValue;
//   bool _controllerWasPlaying = false;
//
//   void seekToRelativePosition(Offset globalPosition) {
//     final box = context.findRenderObject() as RenderBox?;
//     if (box != null) {
//       final Offset tapPos = box.globalToLocal(globalPosition);
//       final double relative = tapPos.dx / box.size.width;
//       final Duration position =
//           (videoPlayerValue?.duration ?? Duration.zero) * relative;
//       widget.controller.playerController.videoSeekTo(position);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (videoPlayerValue == null) return const SizedBox();
//     return Consumer<VideoController>(
//       builder: (context, controller, _) {
//         return LayoutBuilder(
//           builder: (context, size) {
//             return GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               child: _progressBar(size),
//               onHorizontalDragStart: (DragStartDetails details) {
//                 if (!videoPlayerValue!.isInitialized) {
//                   return;
//                 }
//                 _controllerWasPlaying =
//                     controller.playerController.isVideoPlaying;
//                 if (_controllerWasPlaying) {
//                   controller.playerController.pause();
//                 }
//
//                 if (widget.onDragStart != null) {
//                   widget.onDragStart?.call();
//                 }
//               },
//               onHorizontalDragUpdate: (DragUpdateDetails details) {
//                 if (!videoPlayerValue!.isInitialized) {
//                   return;
//                 }
//                 controller.playerController.showOverlay();
//                 seekToRelativePosition(details.globalPosition);
//
//                 widget.onDragUpdate?.call();
//               },
//               onHorizontalDragEnd: (DragEndDetails details) {
//                 if (_controllerWasPlaying) {
//                   controller.playerController.play();
//                 }
//                 if(widget.state.isOverlayVisible){
//                   controller.playerController.hideOverlay();
//
//                 }else{
//                   controller.playerController.showOverlay();
//                 }
//
//                 if (widget.onDragEnd != null) {
//                   widget.onDragEnd?.call();
//                 }
//               },
//               onTapDown: (TapDownDetails details) {
//                 if (!videoPlayerValue!.isInitialized) {
//                   return;
//                 }
//                 seekToRelativePosition(details.globalPosition);
//               },
//             );
//           },
//         );
//
//       },
//     );
//   }
//
//   MouseRegion _progressBar(BoxConstraints size) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: Padding(
//         padding: widget.podProgressBarConfig.padding,
//         child: SizedBox(
//           width: size.maxWidth,
//           height: widget.podProgressBarConfig.circleHandlerRadius,
//           child: Align(
//             alignment: widget.alignment,
//             child:  CustomPaint(
//               painter: _ProgressBarPainter(
//                 videoPlayerValue!,
//                 podProgressBarConfig: widget.podProgressBarConfig.copyWith(
//                   circleHandlerRadius: widget.state.isOverlayVisible ||
//                       widget
//                           .podProgressBarConfig.alwaysVisibleCircleHandler
//                       ? widget.podProgressBarConfig.circleHandlerRadius
//                       : 0,
//                 ),
//               ),
//               size: Size(
//                 double.maxFinite,
//                 widget.podProgressBarConfig.height,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _ProgressBarPainter extends CustomPainter {
//   _ProgressBarPainter(this.value, {this.podProgressBarConfig});
//
//   VideoPlayerValue value;
//   PodProgressBarConfig? podProgressBarConfig;
//
//   @override
//   bool shouldRepaint(CustomPainter painter) {
//     return true;
//   }
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final double height = podProgressBarConfig!.height;
//     final double width = size.width;
//     final double curveRadius = podProgressBarConfig!.curveRadius;
//     final double circleHandlerRadius =
//         podProgressBarConfig!.circleHandlerRadius;
//     final Paint backgroundPaint =
//     podProgressBarConfig!.getBackgroundPaint != null
//         ? podProgressBarConfig!.getBackgroundPaint!(
//       width: width,
//       height: height,
//       circleHandlerRadius: circleHandlerRadius,
//     )
//         : Paint()
//       ..color = podProgressBarConfig!.backgroundColor;
//
//     canvas.drawRRect(
//       RRect.fromRectAndRadius(
//         Rect.fromPoints(
//           Offset.zero,
//           Offset(width, height),
//         ),
//         Radius.circular(curveRadius),
//       ),
//       backgroundPaint,
//     );
//     if (value.isInitialized == false) {
//       return;
//     }
//
//     final double playedPartPercent =
//         value.position.inMilliseconds / value.duration.inMilliseconds;
//     final double playedPart =
//     playedPartPercent > 1 ? width : playedPartPercent * width;
//
//     for (final DurationRange range in value.buffered) {
//       final double start = range.startFraction(value.duration) * width;
//       final double end = range.endFraction(value.duration) * width;
//
//       final Paint bufferedPaint = podProgressBarConfig!.getBufferedPaint != null
//           ? podProgressBarConfig!.getBufferedPaint!(
//         width: width,
//         height: height,
//         playedPart: playedPart,
//         circleHandlerRadius: circleHandlerRadius,
//         bufferedStart: start,
//         bufferedEnd: end,
//       )
//           : Paint()
//         ..color = podProgressBarConfig!.bufferedBarColor;
//
//       canvas.drawRRect(
//         RRect.fromRectAndRadius(
//           Rect.fromPoints(
//             Offset(start, 0),
//             Offset(end, height),
//           ),
//           Radius.circular(curveRadius),
//         ),
//         bufferedPaint,
//       );
//     }
//
//     final Paint playedPaint = podProgressBarConfig!.getPlayedPaint != null
//         ? podProgressBarConfig!.getPlayedPaint!(
//       width: width,
//       height: height,
//       playedPart: playedPart,
//       circleHandlerRadius: circleHandlerRadius,
//     )
//         : Paint()
//       ..color = podProgressBarConfig!.playingBarColor;
//     canvas.drawRRect(
//       RRect.fromRectAndRadius(
//         Rect.fromPoints(
//           Offset.zero,
//           Offset(playedPart, height),
//         ),
//         Radius.circular(curveRadius),
//       ),
//       playedPaint,
//     );
//
//     final Paint handlePaint =
//     podProgressBarConfig!.getCircleHandlerPaint != null
//         ? podProgressBarConfig!.getCircleHandlerPaint!(
//       width: width,
//       height: height,
//       playedPart: playedPart,
//       circleHandlerRadius: circleHandlerRadius,
//     )
//         : Paint()
//       ..color = podProgressBarConfig!.circleHandlerColor;
//
//     canvas.drawCircle(
//       Offset(playedPart, height / 2),
//       circleHandlerRadius,
//       handlePaint,
//     );
//   }
// }
