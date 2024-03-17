import 'package:flutter/material.dart';
import 'package:flutter_task/const/assets.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:lottie/lottie.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Assets.progressAnimation,
                height: Responsive.ms(SizeClass.size200, context)),
          ],
        ),
      ),
    );
  }
}
