import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/auth_screens/verificationforAccount/controllers/verificationforAccountController.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/authAppbarBackButton.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class Verificationforaccountpage extends StatelessWidget {
  const Verificationforaccountpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Verificationforaccountcontroller(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomButton(controller: controller),
          appBar: AppBar(leading: AuthAppBarBackButton()),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.varificationValidKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtext(
                      title: ConstString.verifyAccount,
                      textSize: AppSize.width(value: 22), //22,
                      fontWeight: FontWeight.w500,
                    ),
                    Customtext(
                      title: ConstString.enter6DigitCode,
                      textSize: AppSize.width(value: 10),
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      top: 8,
                      bottom: 22,
                    ),
                    PinCodeTextField(
                      validator: (value) {
                        if (controller.varificationPinCodeController.text.length < 6) {
                          return ConstString.enterFull6DigitOTP;
                        }
                        if (controller.varificationPinCodeController.value.text.isEmpty) {
                          return ConstString.invalidOTP;
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.disabled,
                      keyboardType: TextInputType.number,
                      cursorColor: ConstColour.primaryColor,
                      controller: controller.varificationPinCodeController,
                      appContext: context,
                      length: 6,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: AppSize.height(value: 55),
                        fieldWidth: AppSize.width(value: 50),
                        borderWidth: 1.0,
                        inactiveColor: Colors.white10,
                        selectedColor: Colors.white54,
                        activeColor: Colors.white54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Customtext(
                          title: ConstString.resend,
                          textSize: AppSize.width(value: 11),
                          fontWeight: FontWeight.w400,
                          textColor: ConstColour.primaryColor,
                        ),
                        Customtext(
                          title: ConstString.codeAgain,
                          textSize: AppSize.width(value: 11),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
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

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.controller});

  final Verificationforaccountcontroller controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 55, right: 16, left: 16.0),
      child: CustomElevatedButton(
        child: Customtext(
          title: ConstString.verifyAccount,
          textSize: AppSize.width(value: 12),
          fontWeight: FontWeight.w400,
          textColor: ConstColour.appDarktBackGround,
        ),
        onPressed: () {
          if (controller.varificationValidKey.currentState!.validate()) {
            Get.offAllNamed(AppRoutes.signinpage);
          }
        },
      ),
    );
  }
}
