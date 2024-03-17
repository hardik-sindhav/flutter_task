import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/fonts_size.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';

class ButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final Color? boColor;
  final Color? textColor;
  final double? fontSize;
  final String? text;
  final VoidCallback? voidCallback;
  final double? height;
  final double? width;
  final double? margin;

  const ButtonWidget(
      {Key? key,
      this.buttonColor,
      this.text,
      this.fontSize,
      this.boColor,
      this.textColor,
      this.voidCallback,
      this.height,
      this.width, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        height: Responsive.ms(height ?? SizeClass.size55, context),
        width: width ?? double.infinity,
        margin: Responsive.horizontalPadding(context, margin??SizeClass.size40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.greenColor,
          borderRadius: BorderRadius.all(
            Radius.circular(Responsive.ms(SizeClass.size14, context)),
          ),
          border: Border.all(color: boColor ?? Colors.transparent, width: 2),
        ),
        child: Text(text ?? '',
            style: AppTextStyle()
                .poppinsSemiBold(context: context, fontSize: FontsSize.font16,textColor: textColor)),
      ),
    );
  }
}
