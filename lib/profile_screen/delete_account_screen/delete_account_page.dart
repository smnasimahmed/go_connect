import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_formField.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/profile_screen/delete_account_screen/controller/delete_account_controller.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DeleteAccountController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: CustomElevatedButton(
            bottom: 42,
            right: 12,
            left: 12,
            color: const Color.fromARGB(255, 187, 12, 0),
            child: Customtext(
              title: ConstString.deleteAccount,
              textSize: AppSize.width(value: 18),
              fontWeight: FontWeight.w400,
              textColor: Colors.white,
            ),
            onPressed: () {
              if (controller.signInValidKey.currentState!.validate()) {
                Get.offAllNamed(AppRoutes.signinpage);
              }
            },
          ),
          appBar: appBarBlankWithBackButton(ConstString.deleteAccount),
          body: Form(
            key: controller.signInValidKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 37),
              child: Column(
                children: [
                  Customtext(
                    title: ConstString.deleteAccountMessage,
                    textSize: 16,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textColor: Colors.red,
                    bottom: 20,
                  ),
                  CustomTextFormField(
                    fromTitle: ConstString.pleaseEnterYourPassword,
                    textController: controller.passwordController,
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
                      title: ConstString.password,
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
