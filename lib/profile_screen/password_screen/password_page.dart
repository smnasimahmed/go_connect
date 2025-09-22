import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_formField.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/profile_screen/password_screen/controller/password_controller.dart';
import 'package:go_connect/utils/appSize.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PasswordController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: CustomElevatedButton(
            bottom: 42,
            right: 12,
            left: 12,
            child: Customtext(
              title: ConstString.update,
              textSize: AppSize.width(value: 18),
              fontWeight: FontWeight.w400,
              textColor: Colors.white,
            ),
            onPressed: () {
              if (controller.signInValidKey.currentState!.validate()) {
                Get.back();
              }
            },
          ),
          appBar: appBarBlankWithBackButton(ConstString.changePassword),
          body: Form(
            key: controller.signInValidKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 37),
              child: Column(
                children: [
                  CustomTextFormField(
                    fromTitle: ConstString.currrentPassword,
                    textController: controller.currrentPassword,
                    validator: (value) {
                      if (value!.length < 7) {
                        return ConstString.pleaseEnterPasswordAtLeast8Digit;
                      }
                      if (!value.contains('!') &&
                          !value.contains('@') &&
                          !value.contains('#') &&
                          !value.contains('\$')) {
                        return ConstString.pleaseUseSpecialCharsInPassword;
                      }
                      if (value.isEmpty) {
                        return ConstString.pleaseEnterPassword;
                      }
                      return null;
                    },
                    hintText: Customtext(
                      title: ConstString.enterOldpassword,
                      textColor: ConstColour.cardBorderColour,
                    ),
                  ),

                  CustomTextFormField(
                    fromTitle: ConstString.setPassword,
                    textController: controller.setPassword,
                    validator: (value) {
                      if (controller.setPassword.value.text !=
                          controller.confirmPassword.value.text) {
                        return ConstString.bothPasswordDoesNotMatch;
                      }
                      if (value!.length < 7) {
                        return ConstString.pleaseEnterPasswordAtLeast8Digit;
                      }
                      if (!value.contains('!') &&
                          !value.contains('@') &&
                          !value.contains('#') &&
                          !value.contains('\$')) {
                        return ConstString.pleaseUseSpecialCharsInPassword;
                      }
                      if (value.isEmpty) {
                        return ConstString.pleaseEnterPassword;
                      }
                      return null;
                    },
                    hintText: Customtext(
                      title: ConstString.enterNewpassword,
                      textColor: ConstColour.cardBorderColour,
                    ),
                  ),

                  CustomTextFormField(
                    fromTitle: ConstString.confirmPassword,
                    textController: controller.confirmPassword,
                    validator: (value) {
                      if (controller.setPassword.value.text !=
                          controller.confirmPassword.value.text) {
                        return ConstString.bothPasswordDoesNotMatch;
                      }
                      if (value!.length < 7) {
                        return ConstString.pleaseEnterPasswordAtLeast8Digit;
                      }
                      if (!value.contains('!') &&
                          !value.contains('@') &&
                          !value.contains('#') &&
                          !value.contains('\$')) {
                        return ConstString.pleaseUseSpecialCharsInPassword;
                      }
                      if (value.isEmpty) {
                        return ConstString.pleaseEnterPassword;
                      }
                      return null;
                    },
                    hintText: Customtext(
                      title: ConstString.reEnterNewPassword,
                      textColor: ConstColour.cardBorderColour,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
