// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:pod_player/pod_player.dart';
// import 'package:math_app/config/routes/route_path.dart';
// import 'package:math_app/core/widgets/w_button.dart';
//
// class WPodController extends StatefulWidget {
//   final String url;
//   final bool isOpen;
//
//   const WPodController({Key? key, required this.url, required this.isOpen}) : super(key: key);
//
//   @override
//   State<WPodController> createState() => _WPodControllerState();
// }
//
// class _WPodControllerState extends State<WPodController> {
//   late PodPlayerController controller;
//
//   @override
//   void initState() {
//     if(widget.isOpen){
//       controller =
//       PodPlayerController(
//
//           playVideoFrom: PlayVideoFrom.youtube(widget.url))
//         ..initialise();
//     }
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//
//     if(controller.isInitialised){
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if(!widget.isOpen)...{
//           Center(
//             child: WButton(text: "Kursga ulansih", onTap: (){context.router.pushNamed(RoutePath.plan);}),
//           )
//         }
//       else...     { PodVideoPlayer(
//           controller: controller,
//
//           podPlayerLabels: const PodPlayerLabels(
//
//             play: "Play label customized",
//             pause: "Pause label customized",
//           ),
//         ),}
//
//       ],
//     );
//   }
// }
