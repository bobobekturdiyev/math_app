import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';

import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
@RoutePage()
class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  State<TermsOfUseScreen> createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUseScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){context.router.pop();},
                child:SvgPicture.asset(AppIcons.arrowLeft),),
              const SizedBox(width: 16,),
              Text("Foydalanish shartlari",style: Styles.getTextStyle(fontSize: 16),)
            ],
          ),
        ),
      ),

      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            Text(
              "Foydalanish shartlari",
              style: Styles.getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor),
            ),
            const SizedBox(height: 20,),
            Text("""Kurs boshlovchilar uchun ajoyib qo'llanma sifatida taqdim etiladi. 
Laravel ham boshqa texnologiyalar singari yangi versiyalarida yangicha imkoniyatlar yaratib borayapti. 
Siz kursdan foydalanayotganingizda unda ko'rsatilgan darslarda mavjud laravel versiyasi bilan sizdagi laravel versiyasi boshqa xil ko'rinishidagi fikrda bo'lishingiz tabiiy. 
Lekin kursda keltirgan darslarda Laravelning asosiy qismlari, ma'lumotlar bazasi, blade texnologiyasi, 
MVC qay tarzda shakllantirilganligi ko'rsatiladi va bu barcha versiya uchun deyarli mutlaqo o'zgarmas funksiyalar sanaladi. 
Shu sababli, undan istalgan paytda foydalanish imkoniyatiga egasiz.""",style: Styles.getTextStyle(),)


          ],
        ),
      ),
    );
  }
}
