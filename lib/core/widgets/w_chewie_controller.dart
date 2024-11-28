// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:video_player/video_player.dart';
//
// class CustomVideoPlayer extends StatefulWidget {
//   final String url;
//   final bool autoPlay;
//   final VoidCallback onVideoEnd;
//
//   const CustomVideoPlayer({
//     required this.url,
//     this.autoPlay = false,
//     required this.onVideoEnd,
//   });
//
//   @override
//   _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
// }
//
// class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
//   late VideoPlayerController _videoController;
//   late ChewieController _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializePlayer(
//         'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4');
//   }
//
//   @override
//   void dispose() {
//     _videoController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
//
//   void _initializePlayer(String videoUrl) {
//     _videoController = VideoPlayerController.network(videoUrl)
//       ..addListener(() {
//         if (_videoController.value.position ==
//                 _videoController.value.duration &&
//             _videoController.value.isInitialized) {
//           widget.onVideoEnd();
//         }
//       })
//       ..initialize().then((_) {
//         if (widget.autoPlay) _videoController.play();
//         setState(() {});
//       });
//
//     _chewieController = ChewieController(
//         videoPlayerController: _videoController,
//         autoPlay: widget.autoPlay,
//         aspectRatio: 16 / 9,
//         customControls: MyCustomControls());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//         // _videoController.value.isInitialized
//         Chewie(controller: _chewieController);
//     // : const Center(child: CircularProgressIndicator());
//   }
// }
//
// class MyCustomControls extends StatefulWidget {
//   @override
//   _MyCustomControlsState createState() => _MyCustomControlsState();
// }
//
// class _MyCustomControlsState extends State<MyCustomControls> {
//   bool _isFocused = false;
//   bool _isPlay = false;
//
//   Timer? _debounce;
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final chewieController = ChewieController.of(context);
//
//     return InkWell(
//       onTap: () {
//         if (!_isFocused) {
//           setState(() {
//             _isFocused = true;
//           });
//             if (_debounce?.isActive ?? false) _debounce?.cancel();
//             _debounce = Timer(const Duration(seconds: 2), () {
//           setState(() {
//             _isFocused=false;
//           });
//             });
//         } else {
//           setState(() {
//             _isFocused = false;
//           });
//         }
//       },
//       child: AnimatedOpacity(
//         opacity: _isFocused||!_isPlay ? 1.0 : 0.0,
//         duration: const Duration(milliseconds: 400),
//         child: AspectRatio(
//             aspectRatio: 16/9,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: Icon(
//                   _isPlay ? Icons.pause : Icons.play_arrow,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   if (chewieController.isPlaying) {
//                     chewieController.pause();
//                   } else {
//                     chewieController.play();
//
//                   }
//                   setState(() {
//                     _isPlay = chewieController.isPlaying;
//                   });
//                 },
//               ),
//               // Ovoz sozlash tugmasi
//               IconButton(
//                 icon: Icon(
//                   Icons.volume_up,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   // Ovozni sozlash
//                 },
//               ),
//               // To'liq ekran rejimi
//               IconButton(
//                 icon: Icon(
//                   Icons.fullscreen,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   chewieController.enterFullScreen();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
