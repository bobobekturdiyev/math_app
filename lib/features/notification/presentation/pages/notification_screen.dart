import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_appbar.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: WAppBar(
          title: "Xabarlar",
          trailing: SvgPicture.asset(AppIcons.dotsBadge),
        ),
        body: Column(
          children: [
            if (2 == 1) ...{
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index == 0 || index == 2) ...{
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(
                            index == 0 ? "Bugun" : "Kecha",
                            style: Styles.getTextStyle(),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      },
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(24),
                        color: index != 0
                            ? AppColors.transparent
                            : AppColors.lessonIndexCircleC,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 0
                                    ? AppColors.primaryColorAccent
                                    : AppColors.lessonIndexCircleC,
                              ),
                              child: SvgPicture.asset(AppIcons.discount),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Promo 20% “DTM 2022” kursi uchun",
                                    style: Styles.getNotificationTitle(),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "“DTM 2022” kursining 20% ​​promosiga ega bo‘ling va uni o‘tkazib yubormang",
                                    style: Styles.getTextStyle(fontSize: 10),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "08:00",
                                    style: Styles.getTextStyle(
                                        fontSize: 10,
                                        color: AppColors.subTextColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            } else ...{
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SvgPicture.asset(AppIcons.noNotification),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Hali xabarnoma yo'q!",
                        style: Styles.getNoNotificationStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Har qanday xabarnoma shu yerda paydo bo'ladi",
                        style:
                            Styles.getTextStyle(color: AppColors.subTextColor),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}
