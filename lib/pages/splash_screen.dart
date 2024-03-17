import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/const/assets.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/fonts_size.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/const/text.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/pages/home_page.dart';
import 'package:flutter_task/pages/landing_page.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool? isSignIn = false;

  checkSignIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isSignIn = sharedPreferences.getBool("isSignIn");
  }

  @override
  void initState() {
    super.initState();
    checkSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            FadeOutParticle(
              duration: const Duration(seconds: 2),
              disappear: true,
              onAnimationEnd: () {
                if (isSignIn == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LandingPage(),
                      ));
                }
              },
              child: Image.asset(
                Assets.pngFood,
                height: Responsive.ms(SizeClass.size200, context),
                width: Responsive.ms(SizeClass.size200, context),
              ),
            ),
            const Expanded(child: SizedBox()),
            FadeOutParticle(
              duration: const Duration(seconds: 2),
              disappear: true,
              child: Text(
                TextClass.appNameText,
                style: AppTextStyle().poppinsBold(
                    context: context,
                    textColor: AppColors.greenColor,
                    fontSize: FontsSize.font22),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
