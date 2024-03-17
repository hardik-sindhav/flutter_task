import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';

class SnackBarClass {

  void showSuccessMessage(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.greenColor,
      content: Text(message),
    ));
  }

    void showErrorMessage(
        {required BuildContext context, required String message}) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.redColor,
        content: Text(message),
      ));

  }
}
