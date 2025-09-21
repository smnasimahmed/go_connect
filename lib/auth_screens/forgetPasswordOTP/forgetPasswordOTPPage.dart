import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/auth_screens/forgetPasswordOTP/controllers/forgetPasswordOTPController.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/authAppbarBackButton.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class Forgetpasswordotppage extends StatelessWidget {
  const Forgetpasswordotppage({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmailAddress = Get.arguments;
    return GetBuilder(
      init: Forgetpasswordotpcontroller(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: _bottomButton(controller),
          appBar: AppBar(leading: AuthAppBarBackButton()),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.frgtPassOTPValidKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtext(
                      title: ConstString.sixDigitCodeTitle,
                      textSize: AppSize.width(value: 22),
                      fontWeight: FontWeight.w500,
                    ),
                    Customtext(
                      title: ConstString.weSentYouACodeToVerifyYourIdentity,
                      textSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w300,
                      textColor: Colors.white,
                      top: 8,
                    ),
                    Customtext(
                      title:
                          userEmailAddress ??
                          'No Email ID Inserted', //AppStorage().getEmailID(),
                      textSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      bottom: 22,
                    ),
                    Customtext(
                      title: ConstString.enter6DigitCode,
                      textSize: AppSize.width(value: 10),
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      top: 8,
                      bottom: 14,
                    ),
                    PinCodeTextField(
                      validator: (value) {
                        if (controller.frgtPassPinCodeController.text.length < 6) {
                          return ConstString.enterFull6DigitOTP;
                        }
                        if (controller.frgtPassPinCodeController.value.text.isEmpty) {
                          return ConstString.invalidOTP;
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.disabled,
                      keyboardType: TextInputType.number,
                      cursorColor: ConstColour.primaryColor,
                      controller: controller.frgtPassPinCodeController,
                      appContext: context,
                      length: 6,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 55,
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

  Padding _bottomButton(Forgetpasswordotpcontroller controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 55),
      child: CustomElevatedButton(
        child: Customtext(
          title: ConstString.submitButton,
          textSize: AppSize.width(value: 12),
          fontWeight: FontWeight.w400,
          textColor: ConstColour.appDarktBackGround,
        ),
        onPressed: () {
          if (controller.frgtPassOTPValidKey.currentState!.validate()) {
            Get.offNamed(AppRoutes.resetpasswordpage);
          }
        },
      ),
    );
  }
}
