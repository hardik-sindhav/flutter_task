import 'package:flutter/material.dart';

class Responsive {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double defaultWidth = 430;
  static double defaultHeight = 932;

  static double scale(double size, BuildContext context) =>
      (screenWidth(context) / defaultWidth) * size;

  static double ms(double size, BuildContext context, [double factor = 0.5]) =>
      size + (scale(size, context) - size) * factor;

  static EdgeInsetsGeometry paddingAll(BuildContext context, double value) =>
      EdgeInsets.all(ms(value, context));

  static EdgeInsetsGeometry horizontalPadding(
          BuildContext context, double value) =>
      EdgeInsets.symmetric(horizontal: ms(value, context));

  static EdgeInsetsGeometry verticalPadding(
          BuildContext context, double value) =>
      EdgeInsets.symmetric(vertical: ms(value, context));

  static EdgeInsetsGeometry paddingOnly(BuildContext context, double left,
          double right, double top, double bottom) =>
      EdgeInsets.only(
          left: ms(left, context),
          right: ms(right, context),
          top: ms(top, context),
          bottom: ms(bottom, context));

  static BorderRadiusGeometry borderRadius(
          double radius, BuildContext context) =>
      BorderRadius.all(Radius.circular(ms(radius, context)));

  static BorderRadiusGeometry borderRadiusOnly(
          BuildContext context,
          double topLeft,
          double topRight,
          double bottomLeft,
          double bottomRight) =>
      BorderRadius.only(
          topLeft: Radius.circular(ms(topLeft, context)),
          topRight: Radius.circular(ms(topRight, context)),
          bottomLeft: Radius.circular(ms(bottomLeft, context)),
          bottomRight: Radius.circular(ms(bottomRight, context)));
}
