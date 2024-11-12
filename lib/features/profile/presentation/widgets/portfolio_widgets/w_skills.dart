import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';

import '../../../../../core/resources/styles.dart';
import '../../../../../core/widgets/w_chip_group.dart';
import '../../../data/model/all_info_dto/skills_dto/skills_dto.dart';
import '../../manager/user_bloc/user_bloc.dart';
class WSkills extends StatefulWidget {
  final Function(bool isAd,int id,) tags;
  final List<SkillsDto> skillList;
  const WSkills({Key? key, required this.tags, required this.skillList}) : super(key: key);

  @override
  State<WSkills> createState() => _WSkillsState();
}

class _WSkillsState extends State<WSkills> {
  List<SkillsDto> skills=[];
  final TextEditingController controller=TextEditingController();
  @override
  void initState() {
    skills=context.read<UserBloc>().allInfoDto.skills??[];
    init();

    super.initState();
  }
init(){
    for(int i=0;i<skills.length;i++){
      print(skills[i]);
      widget.tags(true,skills[i].id);
    }
}
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        children: [
          ...List.generate(skills.length, (i) => WChipGroup(items: [
            skills[i].name
          ], closeTap: () {
          setState(() {
            skills.remove(skills[i].id);
            widget.tags(false,skills[i].id);
          });
            },)),
          TextField(
            controller: controller,
            onChanged: (str){
              context.read<ProfileBloc>().add(SkillsAdd( status: StateStatus.loading,text: str));
            },
          ),
      Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.64,
                minHeight: MediaQuery.sizeOf(context).height * 0.2),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(widget.skillList.length, (index) => GestureDetector(
                  onTap: (){ setState(() {
                    controller.text='';
                    context.read<ProfileBloc>().add(SkillsAdd( ));

                    skills.add(widget.skillList[index]);
                    widget.tags(true,widget.skillList[index].id);
                  });},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(widget.skillList[index].name,style: Styles.getTextStyle(fontSize: 18),),
                      ),))

                ],
              ),
            ),
      )
        ],
      ),
    );
  }
}
