// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_task/api/product_api_calling.dart';
import 'package:flutter_task/const/fonts_size.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/model/product_model.dart';
import 'package:flutter_task/pages/home_page.dart';
import 'package:flutter_task/utils/snack_bar.dart';
import 'package:flutter_task/widgets/button_widget.dart';
import 'package:flutter_task/widgets/progress_widget.dart';
import '../utils/textstyle_utils.dart';
import '../widgets/custom_textfield.dart';

class EditProductPage extends StatefulWidget {
  final ProductModel? productModel;
  const EditProductPage({super.key, this.productModel});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  TextEditingController nameCrt = TextEditingController();
  TextEditingController priceCrt = TextEditingController();
  TextEditingController moqCrt = TextEditingController();
  TextEditingController disPriceCrt = TextEditingController();
  bool isLoading = false;
  String? id;

  @override
  void initState() {
    setValue();
    super.initState();
  }

  void setValue(){
    nameCrt.text = widget.productModel?.name??'';
    priceCrt.text = widget.productModel?.price??'';
    moqCrt.text = widget.productModel?.moq??'';
    disPriceCrt.text = widget.productModel?.discountedPrice??'';
    id = widget.productModel?.id??'';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const ProgressWidget()
          : SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
          Responsive.horizontalPadding(context, SizeClass.size20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Responsive.ms(SizeClass.size50, context),
              ),
              Text(
                "Edit Product",
                style: AppTextStyle().poppinsSemiBold(
                    context: context, fontSize: FontsSize.font26),
              ),
              SizedBox(
                height: Responsive.ms(SizeClass.size10, context),
              ),
              CustomTextFieldWidget(
                hint: "Product Name",
                textEditingController: nameCrt,
              ),
              CustomTextFieldWidget(
                hint: "Product Price",
                textEditingController: priceCrt,
                textInputType: TextInputType.number,
              ),
              CustomTextFieldWidget(
                hint: "Product Moq",
                textEditingController: moqCrt,
                textInputType: TextInputType.number,
              ),
              CustomTextFieldWidget(
                hint: "Discounted Price",
                textEditingController: disPriceCrt,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: Responsive.ms(SizeClass.size50, context),
              ),
              ButtonWidget(
                margin: 0,
                text: 'Edit Product',
                width: MediaQuery.of(context).size.width,
                voidCallback: () => editProduct(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void editProduct() async {
    if (nameCrt.text.isEmpty ||
        priceCrt.text.isEmpty ||
        moqCrt.text.isEmpty ||
        disPriceCrt.text.isEmpty) {
      SnackBarClass().showErrorMessage(
          context: context, message: 'Please Fill All Product Details');
    } else {
      setLoader(true);
      var response = await ProductApiCalling().editProduct(
          context: context,
          id: id??'0',
          name: nameCrt.text,
          price: priceCrt.text,
          moq: moqCrt.text,
          dicPrice: disPriceCrt.text);
      setLoader(false);
      if (response['message'] == 'product edited.') {
        SnackBarClass()
            .showSuccessMessage(context: context, message: response['message']);
        clearController();
        Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage(index: 2),));
      } else {
        SnackBarClass()
            .showErrorMessage(context: context, message: response['message']);
      }
    }
  }

  setLoader(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  void clearController() {
    nameCrt.clear();
    priceCrt.clear();
    moqCrt.clear();
    disPriceCrt.clear();
  }
}
