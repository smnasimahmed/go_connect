import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/auth_screens/signIn/controllers/signInController.dart';
import 'package:go_connect/custom_widget/authTopDisplay.dart';
import 'package:go_connect/utils/storage_service.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_formField.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class Signinpage extends StatelessWidget {
  const Signinpage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;
    return GetBuilder(
      init: Signincontroller(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: bottomButtons(controller),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 16.0)),
            child: Form(
              key: controller.signInValidKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTopDisplay(
                    title: ConstString.welcomeBackTitle,
                    subTitile: ConstString.signInToContinueSubtitle,
                  ),
                  CustomTextFormField(
                    hintText: Customtext(
                      title: ConstString.emailAddress,
                      textSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w400,
                    ),

                    textController: controller.signInEmailTextController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ConstString.pleaseEnterEmail;
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return ConstString.pleaseEnterAValidEmailAddress;
                      }
                      return null;
                    },
                    fromTitle: ConstString.phoneNumber,
                  ),
                  CustomTextFormField(
                    hintText: Customtext(
                      title: ConstString.password,
                      textSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w400,
                    ),

                    textController: controller.signInPasswordTextController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ConstString.pleaseEnterPassword;
                      }
                      return null;
                    },
                    fromTitle: ConstString.password,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.forgetpasswordpage),
                        child: Customtext(
                          top: 10,
                          title: '${ConstString.forgetPasswordTitle}?',
                          textSize: AppSize.width(value: 10),
                          fontWeight: FontWeight.w400,
                          textColor: Colors.red,
                        ),
                      ),
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

  Widget bottomButtons(Signincontroller controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 55.0),
      child: SizedBox(
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  child: Customtext(
                    title: ConstString.signIn,
                    textSize: AppSize.width(value: 18),
                    fontWeight: FontWeight.w400,
                    textColor: Colors.white,
                  ),
                  onPressed: () {
                    if (controller.signInValidKey.currentState!.validate()) {
                      AppStorage().setLoginValue(true);
                      Get.offAllNamed(AppRoutes.navbar);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtext(
                      title: ConstString.dontHaveAnAccount,
                      textColor: ConstColour.silverGray20,
                      top: 13,
                      textSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.createaccountpage);
                      },
                      child: Customtext(
                        title: ConstString.createAccount,
                        top: 13,
                        textSize: 12,
                        fontWeight: FontWeight.w500,
                        textColor: ConstColour.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
