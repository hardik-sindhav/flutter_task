import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/const/assets.dart';
import 'package:flutter_task/const/colors.dart';
import 'package:flutter_task/const/fonts_size.dart';
import 'package:flutter_task/const/size.dart';
import 'package:flutter_task/const/text.dart';
import 'package:flutter_task/helper/responsive_sizer.dart';
import 'package:flutter_task/pages/product_action_page.dart';
import 'package:flutter_task/pages/product_page.dart';
import 'package:flutter_task/utils/textstyle_utils.dart';
import 'package:flutter_task/widgets/search_textfield.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  final int? index;
  const HomePage({super.key, this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.index ?? 0;
    super.initState();
  }

  List pages = [
    const ProductPage(),
    const Center(
      child: Text(
        "Cart Page",
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
      ),
    ),
    const ProductActionPage()
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: pages[_currentIndex]),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              elevation: 0,
              backgroundColor: AppColors.whiteColor,
              type: BottomNavigationBarType.fixed,
              fixedColor: AppColors.greenColor,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(IconlyLight.category), label: ''),
                BottomNavigationBarItem(icon: Icon(IconlyLight.buy), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person), label: ''),
              ]),
        ),
      ),
    );
  }
}
