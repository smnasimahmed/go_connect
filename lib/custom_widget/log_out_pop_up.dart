import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/storage_service.dart';

Future<void> logOutPopUp(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: ConstColour.appDarktBackGround, // dark background
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 246,
                  child: Customtext(
                    textAlign: TextAlign.center,
                    title: ConstString.areYouSureLogOut,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    textSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _noButton(context),
                    SizedBox(width: 12),
                    _yesButton(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _yesButton(BuildContext context) {
  return SizedBox(
    height: 30,
    child: ElevatedButton(
      onPressed: () {
        AppStorage().setLoginValue(false);
        Get.toNamed(AppRoutes.signinpage);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Customtext(
        title: ConstString.yes,
        textColor: Colors.white,
        fontWeight: FontWeight.w400,
        textSize: 14,
      ),
      // ),
    ),
  );
}

Widget _noButton(BuildContext context) {
  return SizedBox(
    height: 30,
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstColour.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Customtext(
        title: ConstString.no,
        textColor: ConstColour.appDarktBackGround,
        fontWeight: FontWeight.w400,
        textSize: 14,
      ),
      // ),
    ),
  );
}
