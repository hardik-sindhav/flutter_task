import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/fonts_size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';

class AppTextStyle {

  TextStyle poppinsNormal(
      {required BuildContext context, double? fontSize, Color? textColor}) {
    return TextStyle(
      fontSize: Responsive.ms(fontSize ?? FontsSize.font14, context),
      color: textColor ?? AppColors.blackColor,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    );
  }

  TextStyle poppinsMedium(
      {required BuildContext context, double? fontSize, Color? textColor}) {
    return TextStyle(
      fontSize: Responsive.ms(fontSize ?? FontsSize.font14, context),
      color: textColor ?? AppColors.blackColor,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }

  TextStyle poppinsSemiBold(
      {required BuildContext context, double? fontSize, Color? textColor}) {
    return TextStyle(
      fontSize: Responsive.ms(fontSize ?? FontsSize.font16, context),
      color: textColor ?? AppColors.blackColor,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
  }

  TextStyle poppinsBold(
      {required BuildContext context, double? fontSize, Color? textColor}) {
    return TextStyle(
      fontSize: Responsive.ms(fontSize ?? FontsSize.font18, context),
      color: textColor ?? AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }
}
