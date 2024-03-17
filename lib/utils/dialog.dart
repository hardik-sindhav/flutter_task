import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:flutter_task/widgets/button_widget.dart';
import 'package:flutter_task/widgets/icon_button.dart';
import 'package:iconly/iconly.dart';

class DialogClass {
  deleteAccountDialog(
      BuildContext context, String? text, VoidCallback? voidCallback) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: Responsive.ms(SizeClass.size20, context),
                vertical: Responsive.ms(SizeClass.size50, context)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(Responsive.ms(SizeClass.size20, context))),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Icon(IconlyLight.delete,size: 50,),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Warning!",
                              style:
                                  AppTextStyle().poppinsBold(context: context)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Delete Product!",
                            style: AppTextStyle().poppinsBold(context: context),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "Are you sure want to delete this ",
                                  style: AppTextStyle()
                                      .poppinsNormal(context: context),
                                ),
                                TextSpan(
                                  text: " “$text” ",
                                  style: AppTextStyle()
                                      .poppinsBold(context: context),
                                ),
                                TextSpan(
                                  text: "Product?",
                                  style: AppTextStyle()
                                      .poppinsNormal(context: context),
                                ),
                              ])),
                          SizedBox(
                            height: Responsive.ms(SizeClass.size30, context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: IconButtonWidget(
                                  height: Responsive.ms(SizeClass.size50, context),
                                  text: "Cancel",
                                  isTextShow: true,
                                  voidCallback: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: IconButtonWidget(
                                  height: Responsive.ms(SizeClass.size50, context),
                                  text: "Delete",
                                  isTextShow: true,
                                  textColor: AppColors.whiteColor,
                                  bgColor: AppColors.redColor,
                                  borderColor: AppColors.redColor,
                                  voidCallback: voidCallback,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }
}
