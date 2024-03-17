import 'package:flutter_task/const/text.dart';

class ProductModel {
  String? id;
  String? name;
  String? moq;
  String? price;
  String? discountedPrice;
  String? image;
  String? dic;

  ProductModel({
    this.id,
    this.name,
    this.moq,
    this.price,
    this.discountedPrice,
    this.image,
    this.dic,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      moq: json['moq'],
      price: json['price'],
      discountedPrice: json['discounted_price'],
      image: json['image'] ?? 'assets/images/img1.png',
      dic: json['dic'] ?? TextClass.vegetableDescription,
    );
  }
}
