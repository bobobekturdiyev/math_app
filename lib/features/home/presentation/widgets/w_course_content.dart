import 'package:flutter/material.dart';
import 'package:math_app/core/shared/domain/shared_entities/module_entity.dart';
import 'package:math_app/features/home/presentation/widgets/w_expansion.dart';

class WCourseContent extends StatelessWidget {
  final List<ModuleEntity> modules;
  final Function(int index) onLessonTap;


   WCourseContent({
    Key? key,
    required this.modules, required this.onLessonTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        padding: const EdgeInsets.only(top: 24),
        itemCount: modules.length,
        itemBuilder: (ctx, index) {

          return WExpansionTile(moduleEntity: modules[index], onLessonTap:onLessonTap,);
        });
  }
}
