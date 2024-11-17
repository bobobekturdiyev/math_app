import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/features/profile/presentation/widgets/w_faq_expansion.dart';

@RoutePage()
class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: WAppBar(
        title: "FAQ".tr(),
        trailing: SvgPicture.asset(AppIcons.dotsBadge),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            WFaqExpansion(
                title: "Kurslardan qanday foyda bor?",
                bodyText:
                    "Siz o'zingizning tajribangizga ko'ra kurslarni qidirishingiz mumkin, biz har doim eng so'nggi kurslar uchun 24 soat yangilaymiz. Qidiruv funksiyasidan foydalaning yoki toifaga o'ting yoki u erda eng so'nggi kurslarni topishingiz va o'zingizning ehtiyojlaringizga qarab filtrlardan foydalanishingiz mumkin."),
              WFaqExpansion(
                  title: "Kurslardan qanday foyda bor?",
                  bodyText:
                      "Siz o'zingizning tajribangizga ko'ra kurslarni qidirishingiz mumkin, biz har doim eng so'nggi kurslar uchun 24 soat yangilaymiz. Qidiruv funksiyasidan foydalaning yoki toifaga o'ting yoki u erda eng so'nggi kurslarni topishingiz va o'zingizning ehtiyojlaringizga qarab filtrlardan foydalanishingiz mumkin."),
            WFaqExpansion(
                title: "Kurslardan qanday foyda bor?",
                bodyText:
                "Siz o'zingizning tajribangizga ko'ra kurslarni qidirishingiz mumkin, biz har doim eng so'nggi kurslar uchun 24 soat yangilaymiz. Qidiruv funksiyasidan foydalaning yoki toifaga o'ting yoki u erda eng so'nggi kurslarni topishingiz va o'zingizning ehtiyojlaringizga qarab filtrlardan foydalanishingiz mumkin."),
            WFaqExpansion(
                title: "Kurslardan qanday foyda bor?",
                bodyText:
                "Siz o'zingizning tajribangizga ko'ra kurslarni qidirishingiz mumkin, biz har doim eng so'nggi kurslar uchun 24 soat yangilaymiz. Qidiruv funksiyasidan foydalaning yoki toifaga o'ting yoki u erda eng so'nggi kurslarni topishingiz va o'zingizning ehtiyojlaringizga qarab filtrlardan foydalanishingiz mumkin."),
            WFaqExpansion(
                title: "Kurslardan qanday foyda bor?",
                bodyText:
                "Siz o'zingizning tajribangizga ko'ra kurslarni qidirishingiz mumkin, biz har doim eng so'nggi kurslar uchun 24 soat yangilaymiz. Qidiruv funksiyasidan foydalaning yoki toifaga o'ting yoki u erda eng so'nggi kurslarni topishingiz va o'zingizning ehtiyojlaringizga qarab filtrlardan foydalanishingiz mumkin."),
            WFaqExpansion(
                title: "Kurslardan qanday foyda bor?",
                bodyText:
                "Siz o'zingizning tajribangizga ko'ra kurslarni qidirishingiz mumkin, biz har doim eng so'nggi kurslar uchun 24 soat yangilaymiz. Qidiruv funksiyasidan foydalaning yoki toifaga o'ting yoki u erda eng so'nggi kurslarni topishingiz va o'zingizning ehtiyojlaringizga qarab filtrlardan foydalanishingiz mumkin."),


          ],
        ),
      ),
    );
  }
}
