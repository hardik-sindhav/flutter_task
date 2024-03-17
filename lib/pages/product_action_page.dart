// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/api/product_api_calling.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/pages/add_product_page.dart';
import 'package:flutter_task/pages/edit_product_page.dart';
import 'package:flutter_task/view/product_view.dart';
import 'package:flutter_task/utils/dialog.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:flutter_task/widgets/progress_widget.dart';
import 'package:iconly/iconly.dart';

import '../const/fonts_size.dart';
import '../const/size.dart';
import '../helper/responsive_sizer.dart';
import '../model/product_model.dart';
import '../utils/snack_bar.dart';

class ProductActionPage extends StatefulWidget {
  const ProductActionPage({super.key});

  @override
  State<ProductActionPage> createState() => _ProductActionPageState();
}

class _ProductActionPageState extends State<ProductActionPage> {
  List<ProductModel> productList = [];
  bool isLoading = true;

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: isLoading
            ? const ProgressWidget()
            : productList.isEmpty
                ? const Text("No data found")
                : Padding(
                    padding: Responsive.paddingOnly(context, SizeClass.size14,
                        SizeClass.size14, SizeClass.size40, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Page",
                          style: AppTextStyle().poppinsSemiBold(
                              context: context, fontSize: FontsSize.font26),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            cacheExtent: 0,
                            itemCount: productList.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ProductView(
                                productModel: productList[index],
                                iconData1: IconlyLight.edit,
                                iconData2: IconlyLight.delete,
                                onProductBtn2Click: () => DialogClass()
                                    .deleteAccountDialog(
                                        context,
                                        productList[index].name,
                                        () => deleteProduct(
                                            productList[index].id ?? '')),
                                onProductBtn1Click: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProductPage(
                                          productModel: productList[index]),
                                    )),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
        floatingActionButton: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductPage(),
              )),
          child: Container(
            height: Responsive.ms(SizeClass.size70, context),
            width: Responsive.ms(SizeClass.size70, context),
            decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(Responsive.ms(SizeClass.size20, context)))),
            child: Icon(
              CupertinoIcons.plus,
              size: Responsive.ms(SizeClass.size30, context),
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getProduct() async {
    setLoader(true);
    productList = await ProductApiCalling().getProductList(context);
    setLoader(false);
  }

  Future<void> deleteProduct(String id) async {
    setLoader(true);
    Navigator.pop(context);
    var response =
        await ProductApiCalling().deleteProduct(context: context, id: id);
    if (response['message'] == 'product deleted.') {
      SnackBarClass()
          .showSuccessMessage(context: context, message: response['message']);
      getProduct();
    } else {
      SnackBarClass()
          .showErrorMessage(context: context, message: response['message']);
    }
    setLoader(false);
  }

  void setLoader(bool value) {
    setState(() {
      isLoading = value;
    });
  }
}
