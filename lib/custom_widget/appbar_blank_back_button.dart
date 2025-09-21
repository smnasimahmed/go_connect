import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/utils/appSize.dart';

AppBar appBarBlankWithBackButton(String title) {
  return AppBar(
    centerTitle: true,
    title: Customtext(
      title: title,
      fontWeight: FontWeight.w500,
      textSize: AppSize.width(value: 22),
    ),
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(Icons.arrow_back_rounded),
    ),
  );
}
