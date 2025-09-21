import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/auth_screens/resetPassword/controllers/resetPasswordController.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/authAppbarBackButton.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_formField.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class Resetpasswordpage extends StatelessWidget {
  const Resetpasswordpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Resetpasswordcontroller(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 55, right: 16, left: 16.0),
            child: CustomElevatedButton(
              child: Customtext(
                title: ConstString.continueButton,
                textSize: AppSize.width(value: 12),
                fontWeight: FontWeight.w400,
                textColor: ConstColour.appDarktBackGround,
              ),
              onPressed: () {
                if (controller.resetpassValidKey.currentState!.validate()) {
                  Get.offAllNamed(AppRoutes.signinpage);
                }
              },
            ),
          ),
          appBar: AppBar(leading: AuthAppBarBackButton()),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.resetpassValidKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtext(
                      title: ConstString.resetPasswordTitle,
                      textSize: AppSize.width(value: 22),
                      fontWeight: FontWeight.w500,
                    ),

                    CustomTextFormField(
                      hintText: Customtext(
                        title: ConstString.password,
                        textSize: AppSize.width(value: 12),
                        fontWeight: FontWeight.w400,
                      ),

                      textController: controller.resetpassPasswordConttroller,
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
                      fromTitle: ConstString.setPassword,
                    ),
                    CustomTextFormField(
                      hintText: Customtext(
                        title: ConstString.confirmPassword,
                        textSize: AppSize.width(value: 12),
                        fontWeight: FontWeight.w400,
                      ),

                      textController: controller.resetConfirmPassEmailConttroller,
                      validator: (value) {
                        if (controller.resetpassPasswordConttroller.value.text !=
                            controller.resetConfirmPassEmailConttroller.value.text) {
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
                      fromTitle: ConstString.confirmPassword,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
