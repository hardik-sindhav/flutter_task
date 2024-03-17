import 'package:flutter/material.dart';
import 'package:flutter_task/api/product_api_calling.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/pages/details_page.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:flutter_task/widgets/progress_widget.dart';
import 'package:iconly/iconly.dart';
import '../const/assets.dart';
import '../const/fonts_size.dart';
import '../const/size.dart';
import '../const/text.dart';
import '../helper/responsive_sizer.dart';
import '../model/product_model.dart';
import '../view/product_view.dart';
import '../widgets/search_textfield.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel> productList = [];
  List<ProductModel> newProductList = [];
  bool isLoading = true;

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                Assets.pngFood,
                height: Responsive.ms(200, context),
              )),
          Positioned(
              top: Responsive.ms(SizeClass.size55, context),
              left: Responsive.ms(SizeClass.size14, context),
              child: const Icon(IconlyLight.arrow_left_2)),
          Positioned(
              top: Responsive.ms(100, context),
              left: Responsive.ms(SizeClass.size20, context),
              child: Text(
                TextClass.vegetablesText,
                style: AppTextStyle().poppinsBold(
                    context: context,
                    textColor: AppColors.blackColor,
                    fontSize: FontsSize.font22),
              )),
          Positioned(
              left: Responsive.ms(SizeClass.size14, context),
              right: Responsive.ms(SizeClass.size14, context),
              top: Responsive.ms(160, context),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SearchTextField(
                        onChanged: (value) => searchProduct(value),
                      ),
                      SizedBox(
                        height: Responsive.ms(SizeClass.size10, context),
                      ),
                      Expanded(
                        child: isLoading
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 130),
                                child: ProgressWidget(),
                              )
                            : newProductList.isEmpty
                                ? const Text("No data found")
                                : ListView.builder(
                                    padding: EdgeInsets.zero,
                                    cacheExtent: 0,
                                    itemCount: newProductList.length,
                                    shrinkWrap: true,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ProductView(
                                        productModel: newProductList[index],
                                        onProductClick: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsPage(
                                                  productModel:
                                                  newProductList[index],
                                                ),
                                              ));
                                        },
                                        iconData1: IconlyLight.heart,
                                        iconData2: IconlyLight.buy,
                                      );
                                    },
                                  ),
                      ),
                      SizedBox(
                        height: Responsive.ms(SizeClass.size80, context),
                      )
                    ],
                  )))
        ]));
  }

  Future<void> getProduct() async {
    setLoader(true);
    productList = await ProductApiCalling().getProductList(context);
    setState(() {
      newProductList = productList;
    });
    setLoader(false);
  }

  void setLoader(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  void searchProduct(String value){
    setState(() {
      newProductList = productList
          .where((u) =>
      (u.name!.toLowerCase().contains(value.toLowerCase())))
          .toList();
    });
  }
}
