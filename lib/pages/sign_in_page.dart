// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/const/text.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/utils/snack_bar.dart';
import 'package:flutter_task/widgets/button_widget.dart';
import 'package:flutter_task/widgets/textfield_widget.dart';
import 'package:lottie/lottie.dart';

import '../api/auth_api_calling.dart';
import '../const/assets.dart';
import '../helper/sp_helper.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/progress_widget.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    clearController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        textIconColor: AppColors.greenColor,
        title: TextClass.signInText,
        icon: Icons.close,
        iconColor: AppColors.greenColor,
        voidCallback: () {
          isLoading != true ? Navigator.pop(context) : null;
        },
      ),
      body: isLoading == true
          ? const ProgressWidget()
          : SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: Responsive.horizontalPadding(context, SizeClass.size20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: Responsive.ms(SizeClass.size40, context),
                      ),
                      Lottie.asset(Assets.signUpAnimation,
                          height: Responsive.ms(SizeClass.size270, context)),
                      SizedBox(
                        height: Responsive.ms(SizeClass.size40, context),
                      ),
                      TextFieldWidget(
                        hint: "Email",
                        iconData: CupertinoIcons.mail,
                        textEditingController: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        hint: "Password",
                        iconData: CupertinoIcons.lock,
                        textEditingController: passwordController,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ButtonWidget(
                        margin: 0,
                        text: TextClass.signInText,
                        textColor: AppColors.whiteColor,
                        buttonColor: AppColors.greenColor,
                        voidCallback: () => signIn(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void signIn() async {
    if (emailController.text.isEmpty ||
        !EmailValidator.validate(emailController.text)) {
      SnackBarClass()
          .showErrorMessage(context: context, message: 'Enter valid email');
    } else if (passwordController.text.isEmpty ||
        passwordController.text.length < 5) {
      SnackBarClass().showErrorMessage(
          context: context,
          message: 'Enter valid password. Password length gather than 6.');
    } else {
      setLoader(true);
      var response = await AuthApiCalling().signIn(
          email: emailController.text, password: passwordController.text);
      setLoader(false);
      if (response['message'] == 'Welcome to the flutter app.') {
        SpHelper().setUserToken(response['data']['user_token']);
        SpHelper().isSignIn(true);
        clearController();
        SnackBarClass()
            .showSuccessMessage(context: context, message: response['message']);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      } else {
        SnackBarClass()
            .showErrorMessage(context: context, message: response['message']);
      }
    }
  }

  setLoader(bool value) {
    setState(() {
      isLoading = value;
    });
  }


  void clearController(){
    emailController.clear();
    passwordController.clear();
  }

}
