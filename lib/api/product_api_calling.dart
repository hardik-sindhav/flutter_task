// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/const/text.dart';
import 'package:flutter_task/helper/sp_helper.dart';
import 'package:flutter_task/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../utils/snack_bar.dart';

class ProductApiCalling {
  final String baseUrl = 'https://shareittofriends.com/demo/flutter';
  List images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  Future<List<ProductModel>> getProductList(BuildContext context) async {
    String? userToken = await SpHelper().getUserToken();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/productList.php'),
        body: {
          'user_login_token': userToken??'c2a2f674c6f6a1d2374da1ebfab69adc',
        },
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        List<ProductModel> productList = [];
        var data = json.decode(response.body);

        for (var productData in data) {
          int randomIndex = Random().nextInt(images.length);
          String randomImage = images[randomIndex];
          productData['image'] = randomImage;
          productData['dic'] = TextClass.vegetableDescription;

          ProductModel product = ProductModel.fromJson(productData);
          productList.add(product);
        }
        return productList;
      } else {
        var data = json.decode(response.body);
        SnackBarClass()
            .showErrorMessage(context: context, message: data['message']);
        return [];
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future addProduct(
      {required BuildContext context,
      required String name,
      required String price,
      required String moq,
      required String dicPrice}) async {
    String? userToken = await SpHelper().getUserToken();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/addProduct.php'),
        body: {
          'user_login_token': userToken ?? 'c2a2f674c6f6a1d2374da1ebfab69adc',
          'name': name,
          'price': price,
          'moq': moq,
          'discounted_price': dicPrice,
        },
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        var data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future editProduct(
      {required BuildContext context,
      required String name,
      required String price,
      required String moq,
      required String dicPrice,
      required String id}) async {
    String? userToken = await SpHelper().getUserToken();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/editProduct.php'),
        body: {
          'user_login_token': userToken ?? 'c2a2f674c6f6a1d2374da1ebfab69adc',
          'name': name,
          'price': price,
          'moq': moq,
          'discounted_price': dicPrice,
          'id': id,
        },
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        var data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future deleteProduct(
      {required BuildContext context, required String id}) async {
    String? userToken = await SpHelper().getUserToken();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/deleteProduct.php'),
        body: {
          'user_login_token': userToken ?? 'c2a2f674c6f6a1d2374da1ebfab69adc',
          'id': id,
        },
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        var data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
