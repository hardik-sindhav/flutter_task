import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/model/product_model.dart';
import 'package:flutter_task/widgets/icon_button.dart';
import 'package:flutter_task/widgets/image_silder_widget.dart';
import 'package:iconly/iconly.dart';

import '../utils/textstyle_utils.dart';

class DetailsPage extends StatelessWidget {
  final ProductModel? productModel;
  final VoidCallback? btn1;
  final VoidCallback? btn2;
  const DetailsPage({super.key, this.productModel, this.btn1, this.btn2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const ImageSliderWidget(),
            Positioned(
              top: Responsive.ms(SizeClass.size250, context),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            Responsive.ms(SizeClass.size40, context)),
                        topRight: Radius.circular(
                            Responsive.ms(SizeClass.size40, context)))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.ms(SizeClass.size20, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Responsive.ms(SizeClass.size30, context),
                      ),
                      Text(
                        productModel?.name ?? "",
                        style: AppTextStyle()
                            .poppinsSemiBold(context: context, fontSize: 28),
                      ),
                      SizedBox(
                        height: Responsive.ms(SizeClass.size10, context),
                      ),
                      Row(
                        children: [
                          Text(
                            productModel?.price ?? "0.00",
                            style: AppTextStyle()
                                .poppinsBold(context: context, fontSize: 25),
                          ),
                          SizedBox(
                            width: Responsive.ms(SizeClass.size8, context),
                          ),
                          Text(
                            "€ / pices",
                            style: AppTextStyle().poppinsMedium(
                                context: context,
                                textColor: AppColors.greyColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        productModel?.dic ?? "",
                        style: AppTextStyle().poppinsNormal(
                            context: context,
                            textColor: AppColors.greyColor,
                            fontSize: 16),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SizedBox(
                              width: Responsive.ms(SizeClass.size80, context),
                              child: IconButtonWidget(
                                borderColor: AppColors.greyColor,
                                bgColor: AppColors.whiteColor,
                                isIconShow: true,
                                iconColor: AppColors.greyColor,
                                voidCallback: btn1,
                              )),
                          SizedBox(
                            width: Responsive.ms(SizeClass.size14, context),
                          ),
                          Expanded(
                              child: IconButtonWidget(
                            isIconShow: true,
                            iconData: IconlyLight.buy,
                            isTextShow: true,
                            text: 'ADD TO CART',
                            voidCallback: btn2,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: Responsive.ms(SizeClass.size20, context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
