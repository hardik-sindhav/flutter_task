import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/fonts_size.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:iconly/iconly.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final Color? iconColor;
  final IconData? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final VoidCallback? voidCallback;

  const CustomAppBar({
    super.key,
    this.backgroundColor = Colors.white,
    this.textIconColor,
    this.iconColor,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height = kToolbarHeight,
    this.hideBack = false,
    this.voidCallback,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: MediaQuery.of(context).size.width,
      actions: menuItem,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.whiteColor,
      toolbarHeight: preferredSize.height,
      elevation: 0,
      leading: Row(
        children: [
          SizedBox(width: Responsive.ms(SizeClass.size40, context)),
          const SizedBox(width: 5,),
          Text(title??'',style: AppTextStyle().poppinsSemiBold(context: context,fontSize: FontsSize.font20)),
          const Spacer(),
          GestureDetector(
            onTap: voidCallback,
            child: Container(
              height: Responsive.ms(SizeClass.size40, context),
              width: Responsive.ms(SizeClass.size40, context),
              decoration: BoxDecoration(
                  color: AppColors.greenShadeColor,
                  shape: BoxShape.circle
              ),
              child: Icon(icon??IconlyLight.profile,color: AppColors.black38Color,),
            ),
          ),
          SizedBox(width: Responsive.ms(SizeClass.size20, context)),
        ],
      ),
      centerTitle: false,
    );
  }
}
