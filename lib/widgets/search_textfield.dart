import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../const/colors.dart';
import '../const/size.dart';
import '../helper/responsive_sizer.dart';

class SearchTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const SearchTextField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          contentPadding: EdgeInsets.zero,
          hintText: 'Search',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black38Color,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(Responsive.ms(SizeClass.size40, context)))),
          constraints: const BoxConstraints(maxHeight: 50),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black38Color,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(Responsive.ms(SizeClass.size40, context)))),
          prefixIcon: const Icon(IconlyLight.search)),
    );
  }
}
