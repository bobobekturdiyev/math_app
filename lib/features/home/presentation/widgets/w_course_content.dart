import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/features/home/presentation/manager/lessons/lessons_bloc.dart';
import 'package:math_app/features/home/presentation/widgets/w_expansion.dart';

class WCourseContent extends StatefulWidget {
  final String slug;

  const WCourseContent({Key? key, required this.slug,}) : super(key: key);

  @override
  State<WCourseContent> createState() => _WCourseContentState();
}

class _WCourseContentState extends State<WCourseContent> with AutomaticKeepAliveClientMixin {
late LessonsBloc lessonsBloc;

@override
  void initState() {
  init();
    super.initState();
  }


  void init(){
    lessonsBloc=LessonsBloc(homeRepo: context.read());
    // lessonsBloc.add(GetLessons(slug: widget.slug));
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);

 return BlocProvider(create:(context)=> lessonsBloc,
    child: BlocBuilder<LessonsBloc,LessonsState>(builder: (context,state){
      // if(state is LessonsLoading){
      //   return const Center(child: CircularProgressIndicator(),);
      // }  else if(state is LessonsLoaded){
        return SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 24,),
              ...List.generate(
                    3,
                    (index) => WExpansionTile(
                          title: "state.lessons[index].name",
                          // lesson: state.lessons[index].lesson,
                          isLogin: false,
                        ))
            ],
          ),
        );
      // }else if(state is LessonsError){
      //   return const Center(child: Text("error"),);
      // }else{
      //   return const SizedBox();
      // }
    }),
  );

  }

  @override
  bool get wantKeepAlive => true;
}
