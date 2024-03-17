// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/fonts_size.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/const/text.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/pages/sign_in_page.dart';
import 'package:flutter_task/pages/sign_up_page.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:lottie/lottie.dart';

import '../const/assets.dart';
import '../widgets/button_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TextClass.welcomeText,
                  style: AppTextStyle().poppinsSemiBold(context: context,fontSize: FontsSize.font26),
                ),
                SizedBox(
                  height: Responsive.ms(SizeClass.size40, context),
                ),
                Lottie.asset(Assets.welcomeAnimation,
                    height: Responsive.ms(SizeClass.size270, context)),
                SizedBox(
                  height: Responsive.ms(SizeClass.size80, context),
                ),
                ButtonWidget(
                  buttonColor: AppColors.greenColor,
                  text: TextClass.signUpText,
                  boColor: Colors.transparent,
                  textColor: Colors.white,
                  voidCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ));
                  },
                ),
                SizedBox(
                  height: Responsive.ms(SizeClass.size20, context),
                ),
                ButtonWidget(
                  buttonColor: AppColors.whiteColor,
                  text: TextClass.signInText,
                  boColor: AppColors.greenColor,
                  textColor: AppColors.greenColor,
                  voidCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
