import 'package:flutter/material.dart';
import 'package:flutter_task/model/product_model.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:flutter_task/widgets/icon_button.dart';
import 'package:iconly/iconly.dart';

import '../const/colors.dart';
import '../const/size.dart';
import '../helper/responsive_sizer.dart';

class ProductView extends StatelessWidget {
  final ProductModel? productModel;
  final VoidCallback? onProductClick;
  final VoidCallback? onProductBtn1Click;
  final VoidCallback? onProductBtn2Click;
  final IconData? iconData1;
  final IconData? iconData2;
  const ProductView({super.key, this.productModel, this.onProductClick, this.onProductBtn1Click, this.onProductBtn2Click, this.iconData1, this.iconData2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.paddingOnly(context, 0, 0, SizeClass.size30, 0),
      child: SizedBox(
        height: Responsive.ms(SizeClass.size100, context),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: onProductClick,
              child: Image.asset(
                productModel?.image ?? 'assets/images/img1.png',
                height: Responsive.ms(SizeClass.size100, context),
                width: Responsive.ms(165, context),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    Responsive.paddingOnly(context, SizeClass.size14, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Responsive.ms(SizeClass.size8, context),
                    ),
                    Text(
                      productModel?.name ?? "",
                      style: AppTextStyle().poppinsSemiBold(context: context),
                    ),
                    Row(
                      children: [
                        Text(
                          productModel?.price ?? "data",
                          style: AppTextStyle().poppinsBold(context: context),
                        ),
                        SizedBox(
                          width: Responsive.ms(SizeClass.size8, context),
                        ),
                        Text(
                          "€ / pices",
                          style: AppTextStyle().poppinsMedium(
                              context: context, textColor: AppColors.greyColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: IconButtonWidget(
                            height: SizeClass.size40,
                            borderColor: AppColors.greyColor,
                            bgColor: AppColors.whiteColor,
                            isIconShow: true,
                            iconData: iconData1??IconlyLight.edit,
                            iconColor: AppColors.greyColor,
                            voidCallback: onProductBtn1Click,
                          ),
                        ),
                        SizedBox(
                          width: Responsive.ms(SizeClass.size14, context),
                        ),
                        Expanded(
                            child: IconButtonWidget(
                          height: SizeClass.size40,
                          isIconShow: true,
                          iconData: iconData2??IconlyLight.delete,
                              voidCallback: onProductBtn2Click,
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
