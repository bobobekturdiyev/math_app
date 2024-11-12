import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_images.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';

class WDrop extends StatefulWidget {
  final List<Widget> children;

  const WDrop({Key? key, required this.children}) : super(key: key);

  @override
  State<WDrop> createState() => _WDropState();
}

class _WDropState extends State<WDrop> {
  bool isOpen = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            widget.children.length,
            (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedIndex == index) {
                            selectedIndex = -1;
                          } else {
                            selectedIndex = index;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: selectedIndex == index
                                ? AppColors.primaryColor
                                : AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 10,
                                  blurRadius: 15,
                                  offset: const Offset(12, 10),
                                  color: Colors.black.withOpacity(0.05)),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Programmer UZ",
                              style: Styles.getTextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: selectedIndex == index
                                      ? AppColors.white
                                      : AppColors.black),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Image.asset(
                              AppImages.logoMini,
                              width: 26,
                            )
                          ],
                        ),
                      ),
                    ),
                    if (selectedIndex == index) ...{
                      widget.children[selectedIndex]
                    },
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )));
  }
}
