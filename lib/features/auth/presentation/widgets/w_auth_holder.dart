import 'package:flutter/material.dart';

import '../../../../core/widgets/w_logo.dart';

class WAuthHolder extends StatelessWidget {
  final double windowHeight;
  final double scaleFactor;
  final bool isForgot;
  final bool isLogin;
  final List<Widget> formElements;
  final List<Widget> footerElements;
  final  step;

  const WAuthHolder({
    Key? key,
    required this.windowHeight,
    required this.formElements,
    required this.footerElements,
    this.scaleFactor = 1,
     this.isLogin=true,
    this.isForgot=false,
    this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: windowHeight,
      child: Column(



        children: [
          // if(isLogin)...{
          //   // SizedBox(height: scaleFactor * 120),
          // }else...{
          //   // SizedBox(height: scaleFactor * 50
          //   // ),
          // },
          const Spacer(),
           // const WLogo(size: 100,),

              SizedBox(height: scaleFactor*10,),

          Column(
          children: [
            Container(
              padding: EdgeInsets.all(
                scaleFactor*20
              ),
              margin: EdgeInsets.only(
                right: scaleFactor * 18,
                left: scaleFactor *18,
                top: scaleFactor * 20,
                bottom: scaleFactor * 20,

              ),
              decoration:  BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF081542).withOpacity(0.1),
                    offset: const Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...formElements,
                  ...footerElements
                ],
              ),
            ),
          ],
          ),
          const Spacer(),

        ],
      ),
    );
  }
}
