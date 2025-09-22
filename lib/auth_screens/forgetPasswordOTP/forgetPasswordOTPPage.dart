import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/auth_screens/forgetPasswordOTP/controllers/forgetPasswordOTPController.dart';
import 'package:go_connect/custom_widget/authTopDisplay.dart';
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
          appBar: AppBar(
            leading: AuthAppBarBackButton(),
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.frgtPassOTPValidKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTopDisplay(
                      title: ConstString.verification,
                      subTitile:
                          '${ConstString.sentVerificationCode}   \n${userEmailAddress ?? 'No Email ID Inserted'}',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Customtext(
                          bottom: 10,
                          title: ConstString.code,
                          textSize: AppSize.width(value: 18),
                          fontWeight: FontWeight.w600,
                          textColor: ConstColour.textColor,
                          top: 8,
                        ),
                      ],
                    ),
                    // Customtext(
                    //   title:
                    //       userEmailAddress ??
                    //       'No Email ID Inserted', //AppStorage().getEmailID(),
                    //   textSize: AppSize.width(value: 12),
                    //   fontWeight: FontWeight.w500,
                    //   textColor: ConstColour.textColor,
                    //   bottom: 22,
                    // ),
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
                      cursorColor: ConstColour.textColor,
                      controller: controller.frgtPassPinCodeController,
                      appContext: context,
                      length: 6,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(100),
                        fieldHeight: 55,
                        fieldWidth: AppSize.width(value: 50),
                        borderWidth: 1.0,
                        inactiveColor: ConstColour.cardBorderColour,
                        selectedColor: ConstColour.cardBorderColour,
                        activeColor: ConstColour.cardBorderColour,
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
                    _bottomButton(controller),
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
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      child: CustomElevatedButton(
        child: Customtext(
          title: ConstString.verify,
          textSize: AppSize.width(value: 18),
          fontWeight: FontWeight.w400,
          textColor: Colors.white,
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
