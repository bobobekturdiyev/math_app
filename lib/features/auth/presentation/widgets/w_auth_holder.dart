import 'package:flutter/material.dart';

class WAuthHolder extends StatelessWidget {
  final double scaleFactor;
  final bool isForgot;
  final bool isLogin;
  final List<Widget> formElements;
  final List<Widget> footerElements;
  final step;

  const WAuthHolder({
    Key? key,
    required this.formElements,
    required this.footerElements,
    this.scaleFactor = 1,
    this.isLogin = true,
    this.isForgot = false,
    this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(scaleFactor * 20),
          margin: EdgeInsets.only(
            right: scaleFactor * 18,
            left: scaleFactor * 18,
            top: scaleFactor * 20,
            bottom: scaleFactor * 20,
          ),
          decoration: BoxDecoration(
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
            children: [...formElements, ...footerElements],
          ),
        ),
      ],
    );
  }
}
