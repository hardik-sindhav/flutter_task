import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/fonts_size.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:iconly/iconly.dart';

class IconButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? bgColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final bool? isIconShow;
  final bool? isTextShow;
  final IconData? iconData;
  final String? text;
  final VoidCallback? voidCallback;
  const IconButtonWidget(
      {super.key,
      this.height,
      this.width,
      this.bgColor,
      this.isIconShow,
      this.isTextShow,
      this.borderColor,
      this.iconData,
      this.iconColor,
      this.text, this.voidCallback, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        height: Responsive.ms(height ?? SizeClass.size55, context),
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.greenColor,
            border: Border.all(color: borderColor ?? AppColors.greenColor),
            borderRadius: BorderRadius.all(
                Radius.circular(Responsive.ms(SizeClass.size8, context)))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          isIconShow == true
              ? Icon(iconData ?? IconlyLight.heart,
                  color: iconColor ?? AppColors.whiteColor)
              : Container(),
          isTextShow == true
              ? Row(
                  children: [
                    SizedBox(
                      width: Responsive.ms(SizeClass.size8, context),
                    ),
                    Text(
                      text ?? "",
                      style: AppTextStyle().poppinsSemiBold(
                          context: context,
                          textColor: textColor??AppColors.whiteColor,
                          fontSize: FontsSize.font14),
                    ),
                  ],
                )
              : Container()
        ]),
      ),
    );
  }
}
