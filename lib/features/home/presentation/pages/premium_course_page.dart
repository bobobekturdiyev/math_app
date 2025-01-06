// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:math_app/config/routes/router.gr.dart';
//
// import '../manager/home_bloc/home_screen_bloc.dart';
// import '../manager/home_bloc/home_screen_state.dart';
// import '../widgets/w_course_item.dart';
//
//
// class PremiumCoursePage extends StatelessWidget {
//   const PremiumCoursePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeScreenBloc, HomeScreenState>(
//       builder: (context, state) {
//         if(state is AllCourseLoading){
//           return const Center(child: CircularProgressIndicator(),);
//         }
//         else if( state is AllCourseLoaded){
//           return SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20,),
//             child: Column(
//
//               children: [
//
//                 ...List.generate(10, (index) =>
//                     WCourseItem(onTap: () {
//                       context.router.push(CourseDetailsRoute(slug: state.allCourse[index].slug));
//                     }, courseDto: state.allCourse[index],))
//
//
//               ],
//             ),
//           );
//         } else if( state is AllCourseError){
//           return const Center(child: Text("Error"),);
//         }
//         else{
//           return SizedBox();
//         }
//       },
//     );
//   }
// }
