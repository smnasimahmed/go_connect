import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/auth_screens/createAccount/controllers/createAccountController.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/authTopDisplay.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_formField.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class Createaccountpage extends StatelessWidget {
  const Createaccountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateAccountcontroller(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: bottomButtons(controller),
          appBar: AppBar(
            leading: SizedBox(),
            // leading: AuthAppBarBackButton(),
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.createAccountValidKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTopDisplay(
                      title: ConstString.welcomeBackTitle,
                      subTitile: ConstString.signUpToContinueSubtitle,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hintText: Customtext(
                              title: ConstString.fullName,
                              textSize: AppSize.width(value: 12),
                              fontWeight: FontWeight.w400,
                            ),

                            textController: controller.nameTextController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ConstString.pleaseEnterYourName;
                              }
                              return null;
                            },
                            fromTitle: ConstString.firstNameLabel,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: Customtext(
                              title: ConstString.fullName,
                              textSize: AppSize.width(value: 12),
                              fontWeight: FontWeight.w400,
                            ),

                            textController: controller.nameTextController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ConstString.pleaseEnterYourName;
                              }
                              return null;
                            },
                            fromTitle: ConstString.lastNameLabel,
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormField(
                      hintText: Customtext(
                        title: ConstString.emailAddress,
                        textSize: AppSize.width(value: 12),
                        fontWeight: FontWeight.w400,
                      ),

                      textController: controller.emailTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ConstString.pleaseEnterEmail;
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return ConstString.pleaseEnterAValidEmailAddress;
                        }
                        return null;
                      },
                      fromTitle: ConstString.email,
                    ),
                    CustomTextFormField(
                      hintText: Customtext(
                        title: ConstString.phoneNumber,
                        textSize: AppSize.width(value: 12),
                        fontWeight: FontWeight.w400,
                      ),

                      textController: controller.passwordTextController,
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

                      textController: controller.confirmpasswordTextController,
                      validator: (value) {
                        if (controller.passwordTextController.value.text !=
                            controller.confirmpasswordTextController.value.text) {
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

  Widget bottomButtons(CreateAccountcontroller controller) {
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
                    title: ConstString.signUp,
                    textSize: AppSize.width(value: 18),
                    fontWeight: FontWeight.w400,
                    textColor: Colors.white,
                  ),
                  onPressed: () {
                    if (controller.createAccountValidKey.currentState!.validate()) {
                      Get.toNamed(
                        AppRoutes.verificationforaccountpage,
                        arguments: controller.emailTextController.text,
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtext(
                      title: ConstString.alreadyHaveAnAccount,
                      top: 13,
                      textColor: ConstColour.cardBorderColour,
                      textSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Customtext(
                        title: ConstString.signIn,
                        top: 13,
                        textSize: AppSize.width(value: 12),
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
