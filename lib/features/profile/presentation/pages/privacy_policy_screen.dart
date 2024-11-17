import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_appbar.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: WAppBar(
        title: "privacy_policy".tr(),
        trailing: SvgPicture.asset(AppIcons.dotsBadge),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.C_FAFAFA,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              ...List.generate(2, (index)=>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yig'ilgan ma'lumotlar turlari",
                        style: Styles.getTextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        """Maxfiylik siyosati - bu huquqiy hujjat bo'lib, u veb-saytingizga tashrif buyuruvchilarga ularda to'plangan ma'lumotlar va kompaniyangiz undan qanday foydalanishi haqida ma'lumot beradi.

Ushbu maqola yaxshi Maxfiylik siyosatining tarkibiy qismlarini qamrab oladi va mijozlaringizda ishonch va ishonchni mustahkamlaydigan hamda sizni turli javobgarlik masalalaridan himoya qiladigan siyosatni qanday yaratishni yaxshiroq tushunishga yordam beradi. Shuningdek, siz boshqa korxonalar qonunga rioya qilish va mijozlarni oʻzlarining maxfiylik amaliyotlari haqida xabardor qilish uchun Maxfiylik siyosatlaridan qanday foydalanganliklari misollarini topasiz.

Shuningdek, biz Maxfiylik siyosati shablonini ham to‘pladik, undan siz o‘zingiz yozishga yordam berishingiz mumkin.""",
                        style: Styles.getTextStyle(
                          fontSize: 12,
                          color: AppColors.subTextColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20,)
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
