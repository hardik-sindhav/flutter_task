import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({Key? key}) : super(key: key);

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  List images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Responsive.ms(SizeClass.size300, context),
        child: ScrollPageView(
          checkedIndicatorColor: AppColors.whiteColor,
          delay: const Duration(seconds: 3),
          controller: ScrollPageController(),
          indicatorColor: AppColors.greyColor,
          indicatorPadding:
              EdgeInsets.only(bottom: Responsive.ms(SizeClass.size55, context)),
          children: images.map((image) => _imageView(image)).toList(),
        ));
  }

  Widget _imageView(String image) {
    return Image.asset(image, fit: BoxFit.cover);
  }
}
