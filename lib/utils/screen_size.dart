import 'package:flutter/material.dart';

class ScreenUtils{
  final BuildContext context;

  ScreenUtils(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
}