import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/features/show_lesson/presentaion/widgets/w_pod_controller.dart';

import '../../../../core/resources/app_colors.dart';
import '../manager/lesson_show_bloc.dart';
import '../widgets/w_chewie_controller.dart';
@RoutePage()
class ShowLessonScreen extends StatefulWidget {
  final String slug;
  const ShowLessonScreen({Key? key, required this.slug}) : super(key: key);

  @override
  State<ShowLessonScreen> createState() => _ShowLessonScreenState();
}

class _ShowLessonScreenState extends State<ShowLessonScreen> {
  late LessonShowBloc _lessonShowBloc;



  @override
  void initState() {
    _lessonShowBloc = LessonShowBloc( showLessonRepo: context.read());
    _lessonShowBloc.add(LoadingLessonShow(lessonSlug: widget.slug, ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => _lessonShowBloc,
        child: BlocBuilder<LessonShowBloc, LessonShowState>(
          builder: (context, state) {
            if (state is LessonShowInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LessonShowLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  state.req.videoFiles[0].status == "main"
                      ? WChewiePlayer(url:  state.req.videoFiles[0].fileUrl,isOpen: state.req.isOpen=='open')
                      :   WPodController(url: state.req.videoFiles[0].fileUrl, isOpen: state.req.isOpen=='open',)

                ],
              );
            }  else if(state is LessonShowError){

            return  const Center(child: Text("error"),);
            } else {

              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}