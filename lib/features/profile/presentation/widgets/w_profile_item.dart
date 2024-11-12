import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/award_dto/award_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/education_dto/education_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/experience_dto/experience_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/language_dto/language_dto.dart';
import 'package:math_app/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_wrap.dart';

import '../../../../config/routes/route_path.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../manager/portfolio_delete_bloc/portfolio_del_bloc.dart';
import '../manager/user_bloc/user_bloc.dart';

class WProfileItem extends StatefulWidget {
  const WProfileItem({Key? key, }) : super(key: key);
  @override
  State<WProfileItem> createState() => _WProfileItemState();
}
class _WProfileItemState extends State<WProfileItem> {
  @override
  Widget build(BuildContext context) {
   var allInfo= context.read<UserBloc>().allInfoDto;
  var user=context.read<UserBloc>().allInfoDto.student;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WWrap(title: 'ID: ${user.studentId}',
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email: ${user.email}",
                style: Styles.getTextStyle(color: AppColors.text2),
              ),

              Text(
                "Hisobim: ${user.balance} so’m",
                style: Styles.getTextStyle(color: AppColors.text2),
              ),
              Text(
                "Phone: +${user.phone}",
                style: Styles.getTextStyle(color: AppColors.text2),
              ),
            ],
          ),),
        WWrap(title: 'About',
          isAdd:false,
          onTap: () {

            context.router.pushNamed(RoutePath.aboutAdd);},
          child: Column(
            children: [
              Text(
                allInfo.student.about??'',
                style: Styles.getTextStyle(color: AppColors.text2),
              ),
            ],
          ),),
        WWrap(title: 'Skills',
          isAdd: false,
          onTap: () {
            context.read<ProfileBloc>().add(SkillsAdd());

            if(allInfo.skills.isEmpty){
          }
          context.router.pushNamed(RoutePath.skillsScreen);

          },
          child: Wrap(
            children: [
              ...List.generate(
                allInfo.skills.length,
                  (index) => _wrapItem(allInfo.skills[index].name),)
            ],
          ),),
        WWrap(title: 'Languages',
          isAdd: true,
          onTap: () {
          context.router.pushNamed(RoutePath.language);
          },
          child: Column(
            children:List.generate(
              allInfo.languages?.length??0,
                  (i) => _langItem(lang: allInfo.languages![i]

                  ),),
          ),),
        WWrap(
          isBorder: true,
          isAdd: true,
          title: 'Experience',
          onTap: () {
            context.router.pushNamed(RoutePath.experience);
          },
          child: Column(
            children:
              List.generate(
                allInfo.experience.length,
                    (i) =>
                        _expItem(exp: allInfo.experience[i]),
              ),

          ),),
        WWrap(
          isBorder: true,


          title: 'Education',
          onTap: () {
            context.router.pushNamed(RoutePath.education);

          },
          child: Column(
            children: List.generate(
              allInfo.education.length,
              (index) => _eduItem(edu: allInfo.education[index]),
            ),
          ),),
        WWrap(
          isBorder: true,

          title: 'Licenses § certifications',
          onTap: () {
            context.router.pushNamed(RoutePath.award);

          },
          child: Column(
            children: List.generate(
              allInfo.award.length,
                  (index) => _certificateItem(award: allInfo.award[index]),),
          ),),
        WWrap(
          isBorder: true,

          title: 'Courses',
          onTap: () {},
          child: Column(
            children:List.generate(
              allInfo.course?.length??0,
                  (i) => Text("• ${allInfo.course?[i].status}",style: Styles.getTextStyle(),),

            ),
          ),),
        WWrap(
          isBorder: true,

          title: 'Projects',
          onTap: () {},
          child: Column(
            children: [
              _projectItem(),
              const SizedBox(height: 20,),
              _projectItem(),


            ],
          ),),
                  ],);
  }
  Widget _wrapItem(String text){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4 ),
      margin: const EdgeInsets.only(left: 8,bottom: 16 ),
      decoration: BoxDecoration(
          color: AppColors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
        text,
        style: Styles.getTextStyle(
            fontWeight: FontWeight.w500, fontSize: 16,color: AppColors.green),
      ),
    );

  }
  Widget _langItem({required LanguageDto lang}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              lang.language,
              style: Styles.getTextStyle(
                  fontWeight: FontWeight.w500, fontSize: 16,color: AppColors.primaryColor),
            ),
            const SizedBox(height: 8,),
            Text(
              lang.level,
              style: Styles.getTextStyle(),
            ),
            const SizedBox(height: 16,)
          ],
        ),
        _delEdit(onDelTap: () {
          _deleteBloc(event:LangDelete(id: lang.id));
        }, onEditTap: () {
          context.router.push(LanguageEditRoute(id: lang.id));
        })
      ],
    );

  }
  Widget _expItem({required ExperienceDto exp,}) {return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: CachedNetworkImageProvider(
                  "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4914.jpg"),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp.title,
                    style: Styles.getTextStyle(
                        color: AppColors.text, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        exp.companyName,
                        style: Styles.getTextStyle(
                          fontSize: 12,
                          color: AppColors.text,
                        ),
                      ),
                      Text(
                        "|",
                        style: Styles.getTextStyle(
                            fontSize: 12, color: AppColors.C_D9D9D9),
                      ),
                      Text(
                        "Full time",
                        style: Styles.getTextStyle(
                          fontSize: 12,
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${exp.fromDate} - Present",
                          style: Styles.getTextStyle(
                            fontSize: 12,
                            color: AppColors.C_777777,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: Styles.getTextStyle(
                            fontSize: 12, color: AppColors.C_D9D9D9),
                      ),
                      Expanded(
                        child: Text(
                          exp.toDate,
                          style: Styles.getTextStyle(
                            fontSize: 12,
                            color: AppColors.C_777777,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _delEdit(onDelTap: () {
              _deleteBloc(event:ExpDelete(id: exp.id));
            }, onEditTap: () {
              context.router.push(ExperienceRoute(id: exp.id));
            })
          ],
        ),
      ],
    );}
  Widget _eduItem({required EducationDto edu,}) {return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
             const CircleAvatar(
              radius: 22,
              backgroundImage: CachedNetworkImageProvider(
                  "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4914.jpg"),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    edu.universityName,
                    style: Styles.getTextStyle(
                        color: AppColors.text,

                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        "Bachelors",
                        style: Styles.getTextStyle(
                          fontSize: 12,
                          color: AppColors.text,
                        ),
                      ),
                      Text(
                        "|",
                        style: Styles.getTextStyle(
                            fontSize: 12, color: AppColors.C_D9D9D9),
                      ),
                      Expanded(
                        child: Text(
                          "Computer Software Engineering",
                          style: Styles.getTextStyle(
                            fontSize: 12,
                            color: AppColors.text,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${edu.fromDate}-${edu.toDate}",
                          style: Styles.getTextStyle(
                            fontSize: 12,
                            color: AppColors.C_777777,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _delEdit(onDelTap: () {
              _deleteBloc(event:EduDelete(id: edu.id));
            }, onEditTap: () {
              context.router.push(EducationRoute(id: edu.id));
            })
          ],
        ),
        const SizedBox(height: 20,)

      ],
    );}
  Widget _certificateItem({required AwardDto award,}){return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
             Container(
               padding: const EdgeInsets.all(16),
               decoration:  BoxDecoration(
                 color: const Color(0xFFF1EFFF),
                 shape: BoxShape.circle,
                 border: Border.all(color: AppColors.primaryColor)
               ),
               child: SvgPicture.asset(AppIcons.file),
             ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    award.title,
                    style: Styles.getTextStyle(
                        color: AppColors.text,

                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFFF7F6FF),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Show credential",
                          style: Styles.getTextStyle(fontSize: 12,color: AppColors.text2),
                          ),
                          const SizedBox(width: 4,),
                          SvgPicture.asset(AppIcons.arrowUpRight)
                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
            _delEdit(onDelTap: () { _deleteBloc(event: AwardDelete(id: award.id) ); }, onEditTap: () { context.router.push(AwardRoute(  id:award.id )); })
          ],
        ),
        const SizedBox(height: 20,)

      ],
    );}
  Widget _delEdit({required GestureTapCallback onDelTap, required GestureTapCallback onEditTap}){
    return   Row(
      children: [
        GestureDetector(
          onTap: onDelTap,
          child: SvgPicture.asset(
              AppIcons.delete
          ),
        ),
        const SizedBox(width: 12,),
        GestureDetector(
          onTap: onEditTap,
          child: SvgPicture.asset(
              AppIcons.pencil
          ),
        ),
      ],
    );
  }
  Widget _projectItem(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Name of License",
          style: Styles.getTextStyle(
              color: AppColors.text,

              fontWeight: FontWeight.w500),
        ),
        Text("2017-2021",
          style: Styles.getTextStyle(
            fontSize: 12,
            color: AppColors.C_777777,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFFF7F6FF),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Show credential",
                style: Styles.getTextStyle(fontSize: 12,color: AppColors.text2),
              ),
              const SizedBox(width: 4,),
              SvgPicture.asset(AppIcons.arrowUpRight)
            ],
          ),
        )


      ],
    );

  }
  _deleteBloc({required PortfolioDelEvent event})async{
    context.read<PortfolioDelBloc>().add(event);
    BlocListener(listener: ( context, state) {
     if(state is DelSuccess){
       context.read<UserBloc>().add(GetUserData());
     }
   },);
  }
}
