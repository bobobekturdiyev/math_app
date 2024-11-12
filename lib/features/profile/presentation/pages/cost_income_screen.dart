import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../widgets/w_cost_income_item.dart';

@RoutePage()
class CostIncomeScreen extends StatefulWidget {
  const CostIncomeScreen({Key? key}) : super(key: key);

  @override
  State<CostIncomeScreen> createState() => _CostIncomeScreenState();
}

class _CostIncomeScreenState extends State<CostIncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){context.router.pop();},
                child: SvgPicture.asset(AppIcons.arrowLeft),
              ),
              const SizedBox(width: 16,),
              Text("Hisoblar tarixi", style: Styles.getTextStyle(fontSize: 16)),

            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        child:Column(
          children:[
            const SizedBox(height: 20,),
            ...List.generate(16, (index) => const WCostIncomeItem())

          ]
        )
      )
    );
  }
}
