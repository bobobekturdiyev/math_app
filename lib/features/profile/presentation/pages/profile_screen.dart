import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/features/profile/presentation/widgets/w_profile_section_item.dart';
import 'package:math_app/features/profile/presentation/widgets/w_profile_top_bar.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';


@RoutePage()
class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WProfileTopBar(),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "general".tr(),
                  style: Styles.getTextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 24,
                ),
                WProfileSectionItem(
                  leadingIconPath: AppIcons.user,
                  title: "personal_information".tr(),
                  onTap: () {
                    context.router.pushNamed(RoutePath.personalInfo);
                  },
                ),
                WProfileSectionItem(
                  leadingIconPath: AppIcons.security,
                  title: "security".tr(),
                  onTap: () {
                    context.router.pushNamed(RoutePath.personalInfo);

                  }
                  ,
                ),
                Text(
                  "other".tr(),
                  style: Styles.getTextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 24,
                ),
                WProfileSectionItem(
                  leadingIconPath: AppIcons.setting,
                  title: "settings".tr(),
                  onTap: () {
                    context.router.pushNamed(RoutePath.settings);

                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// BlocBuilder<UserBloc,UserState>(
// builder: (context, state) {
// if(state is UserLoading){
// return const Center(child:CircularProgressIndicator(),);
// }else if(state is UserLoaded){
// return SingleChildScrollView(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Column(
// children: [
// const SizedBox(height: 16,),
// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
//
// children: [
// const CircleAvatar(
// radius: 40,
// backgroundImage: CachedNetworkImageProvider(
// "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4914.jpg"),
// ),
// const SizedBox(
// width: 20,
// ),
// Expanded(
// child: Container(
// height: 80,
// padding: const EdgeInsets.symmetric(vertical: 8),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisSize: MainAxisSize.min,
// children: [
// Text(
// "${context.read<UserBloc>().allInfoDto.student.name} ${context.read<UserBloc>().allInfoDto.student.surname}",
// style: Styles.getTextStyle(
// color: AppColors.primaryColor,
// fontSize: 16,
// fontWeight: FontWeight.w600),
// ),
// Text(
// "Front-End Developer Front-End Developer",
// style: Styles.getTextStyle(
// fontWeight: FontWeight.w500,
// fontSize: 12,
// color: AppColors.text2),
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// )
// ],
// ),
// ),
// )
// ],
// ),
// const SizedBox(height: 20,),
// const WProfileItem(),
//
// const SizedBox(height: 20,),
//
// ],
// ),
// );
// }else if(state is UserError){
// return const Center(child: Text("Error"),);
// }else{
// return Center(child: WButton(text: 'Kirish',onTap: (){context.router.replaceNamed(RoutePath.login);},),);
// }
// },),
