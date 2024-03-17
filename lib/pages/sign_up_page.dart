// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/const/assets.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/const/text.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/helper/sp_helper.dart';
import 'package:flutter_task/model/sign_up_model.dart';
import 'package:flutter_task/pages/home_page.dart';
import 'package:flutter_task/utils/snack_bar.dart';
import 'package:flutter_task/widgets/button_widget.dart';
import 'package:flutter_task/widgets/textfield_widget.dart';
import 'package:lottie/lottie.dart';

import '../api/auth_api_calling.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/progress_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        textIconColor: AppColors.greenColor,
        title: TextClass.signUpText,
        icon: Icons.close,
        iconColor: AppColors.greenColor,
        voidCallback: () {
          isLoading != true ? Navigator.pop(context) : null;
        },
      ),
      body: isLoading
          ? const ProgressWidget()
          : SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(Assets.signUpAnimation, height: 250),
                    SizedBox(
                      height: Responsive.ms(SizeClass.size50, context),
                    ),
                    TextFieldWidget(
                      hint: "Username",
                      iconData: CupertinoIcons.person,
                      textEditingController: usernameController,
                    ),
                    TextFieldWidget(
                      hint: "Email",
                      iconData: CupertinoIcons.mail,
                      textEditingController: emailController,
                    ),
                    TextFieldWidget(
                      hint: "Mobile",
                      iconData: CupertinoIcons.phone,
                      textEditingController: mobileController,
                      inputType: TextInputType.number,
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
                      text: TextClass.signUpText,
                      textColor: AppColors.whiteColor,
                      buttonColor: AppColors.greenColor,
                      voidCallback: () => signUp(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void signUp() async {
    if (emailController.text.isEmpty ||
        !EmailValidator.validate(emailController.text)) {
      SnackBarClass()
          .showErrorMessage(context: context, message: 'Enter valid email');
    } else if (usernameController.text.isEmpty) {
      SnackBarClass()
          .showErrorMessage(context: context, message: 'Enter username');
    } else if (passwordController.text.isEmpty ||
        passwordController.text.length < 5) {
      SnackBarClass().showErrorMessage(
          context: context,
          message: 'Enter valid password. Password length gather than 6.');
    } else if (mobileController.text.isEmpty ||
        passwordController.text.length < 9) {
      SnackBarClass().showErrorMessage(
          context: context, message: 'Enter valid mobile number.');
    } else {
      setLoader(true);
      final SignUpModel signUpModel = SignUpModel(
          name: usernameController.text,
          email: emailController.text,
          mobile: mobileController.text,
          password: passwordController.text);
      var response = await AuthApiCalling().signUp(signUpModel);
      setLoader(false);
      if (response['message'] == 'Your account is created.') {
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

  void clearController() {
    usernameController.clear();
    emailController.clear();
    mobileController.clear();
    passwordController.clear();
  }
}
