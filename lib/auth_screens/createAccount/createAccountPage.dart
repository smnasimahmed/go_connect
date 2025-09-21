import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/auth_screens/createAccount/controllers/createAccountController.dart';
import 'package:go_connect/constant/ImageString.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/authAppbarBackButton.dart';
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
          appBar: AppBar(leading: AuthAppBarBackButton()),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.createAccountValidKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtext(
                      title: ConstString.createAccount,
                      textSize: 22,
                      bottom: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomTextFormField(
                      hintText: Customtext(
                        title: ConstString.fullName,
                        textSize: AppSize.width(value: 12),
                        fontWeight: FontWeight.w400,
                      ),

                      textController: controller.nameTextController,
                      validator: (value) {
                        if (!value!.contains(' ')) {
                          return ConstString.pleaseEnterYourFullName;
                        }
                        if (value.isEmpty) {
                          return ConstString.pleaseEnterYourName;
                        }
                        return null;
                      },
                      fromTitle: '',
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
                      fromTitle: '',
                    ),
                    CustomTextFormField(
                      hintText: Customtext(
                        title: ConstString.password,
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
                    title: ConstString.createNewAccountButton,
                    textSize: AppSize.width(value: 12),
                    fontWeight: FontWeight.w400,
                    textColor: ConstColour.appDarktBackGround,
                  ),
                  onPressed: () {
                    if (controller.createAccountValidKey.currentState!.validate()) {
                      Get.toNamed(AppRoutes.verificationforaccountpage);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtext(
                      title: ConstString.alreadyHaveAnAccount,
                      top: 13,
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
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(color: ConstColour.silverGray20),
                        ),
                      ),
                      Customtext(title: ConstString.or, right: 14, left: 14),
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(color: ConstColour.silverGray20),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  isoutLined: true,
                  outLineColour: ConstColour.silverGray20,
                  child: _googleFacebookAuthButton(
                    assetPath: ImageString.googleLogo,
                    buttonText: ConstString.signInWithGoogle,
                  ),
                  onPressed: () {},
                ),

                CustomElevatedButton(
                  isoutLined: true,
                  outLineColour: ConstColour.silverGray20,
                  child: _googleFacebookAuthButton(
                    assetPath: ImageString.facebookLogo,
                    buttonText: ConstString.signInWithFacebook,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _googleFacebookAuthButton({required String assetPath, required String buttonText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(assetPath, height: AppSize.height(value: 26)),
        SizedBox(width: AppSize.width(value: 12)),
        Customtext(
          title: buttonText,
          textSize: AppSize.width(value: 12),
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
