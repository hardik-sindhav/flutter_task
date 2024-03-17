import 'package:flutter/material.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';

class TextFieldWidget extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final IconData? iconData;
  final String? hint;
  final double? padding;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  const TextFieldWidget(
      {Key? key,
      this.validator,
      this.iconData,
      this.hint,
      this.textEditingController, this.padding, this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.ms(padding??0, context),
          vertical: SizeClass.size10),
      child: SizedBox(
        height: Responsive.ms(SizeClass.size55, context),
        child: TextFormField(
          keyboardType: inputType??TextInputType.text,
          cursorColor: Colors.black38,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyle().poppinsMedium(
                context: context, textColor: AppColors.black38Color),
            filled: true,
            fillColor: AppColors.greenShadeColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  Responsive.ms(SizeClass.size14, context)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    Responsive.ms(SizeClass.size14, context)),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    Responsive.ms(SizeClass.size14, context)),
                borderSide: const BorderSide(color: Colors.transparent)),

            prefixIcon: Icon(
              iconData,
              color: Colors.black38,
            ),
          ),
          validator: validator,
          controller: textEditingController,
        ),
      ),
    );
  }
}
