
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/features/profile/presentation/manager/user_bloc/user_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/locator.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/w_button.dart';
import '../manager/download_provider/dowload_provider.dart';
import '../widgets/w_profile_item.dart';

@RoutePage()
class
MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Profile", style: Styles.getTextStyle(fontSize: 16)),
              Row(
                children: [
                  ChangeNotifierProvider(
                    create: (context) => DownloadProvider(),
                    child: Consumer<DownloadProvider>(

                      builder: (context, value, ch) {

                        return  GestureDetector(
                          onTap: ()async {
                            value.download(
                                context
                                        .read<UserBloc>()
                                        .allInfoDto
                                        .student
                                        .name +
                                    context
                                        .read<UserBloc>()
                                        .allInfoDto
                                        .student
                                        .surname,
                                0);
                          },
                          child: SvgPicture.asset(AppIcons.download),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: _showBottom,
                    child: SvgPicture.asset(AppIcons.menu),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<UserBloc,UserState>(
        builder: (context, state) {
        if(state is UserLoading){
          return const Center(child:CircularProgressIndicator(),);
        }else if(state is UserLoaded){
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 16,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(
                          "https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4914.jpg"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                              Text(
                                "${context.read<UserBloc>().allInfoDto.student.name} ${context.read<UserBloc>().allInfoDto.student.surname}",
                                style: Styles.getTextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                              "Front-End Developer Front-End Developer",
                              style: Styles.getTextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.text2),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                const WProfileItem(),

                const SizedBox(height: 20,),

              ],
            ),
          );
        }else if(state is UserError){
          return const Center(child: Text("Error"),);
        }else{
          return Center(child: WButton(text: 'Kirish',onTap: (){context.router.replaceNamed(RoutePath.login);},),);
        }
      },),
    );
  }

  _showBottom() {
    showModalBottomSheet(
        context: locator<GlobalKey<ScaffoldState>>().currentContext!,
        builder: (ctx){
      return Wrap(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16,right: 20,left: 20),
            decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16))),
            child:  Column(
              children: [
                Container(
                  width:  52,
                  height: 2,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8A8A93),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                if(context.read<UserBloc>().isLogin)...{
                  _bottomItem(AppIcons.dollar,"Mening hisobim", onTap: () { context.router.pushNamed(RoutePath.costIncome);  }),

                },
                _bottomItem(AppIcons.grid,"Tariflar", onTap: () {context.router.pushNamed(RoutePath.plan);  }),
                if(context.read<UserBloc>().isLogin)...{
                  _bottomItem(AppIcons.lock,"Parolni yangilash", onTap: () { context.router.pushNamed(RoutePath.updatePassword); }),
                },

                _bottomItem(AppIcons.smile,"Biz haqimizda", onTap: () { context.router.pushNamed(RoutePath.about); }),
                _bottomItem(AppIcons.alertCircle,"Foydalanish shartlari", onTap: () {context.router.pushNamed(RoutePath.termsUse);  }),
                if(context.read<UserBloc>().isLogin)...{
                  GestureDetector(
                    onTap: () {context.read<UserBloc>().add(LogOut());},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppIcons.logOut),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Tizimdan chiqish",
                            style: Styles.getTextStyle(
                                fontSize: 16,
                                color: AppColors.danger,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                },
                const SizedBox(height: 8,)
              ],
            ),
          ),
        ],
      );

    });
  }

  Widget _bottomItem(String icon,String title,{ required GestureTapCallback onTap} ){
    return GestureDetector(
      onTap: (){
        onTap();
        context.popRoute();
        },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 12,),
            Text(title,style: Styles.getTextStyle(fontSize: 16,color: AppColors.text),)
          ],
        ),
      ),
    );
  }
}
