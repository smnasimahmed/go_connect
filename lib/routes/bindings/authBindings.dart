import 'package:get/get.dart';
import 'package:go_connect/auth_screens/createAccount/controllers/createAccountController.dart';
import 'package:go_connect/auth_screens/forgetPassword/controllers/forgetPasswordController.dart';
import 'package:go_connect/auth_screens/forgetPasswordOTP/controllers/forgetPasswordOTPController.dart';
import 'package:go_connect/auth_screens/resetPassword/controllers/resetPasswordController.dart';
import 'package:go_connect/auth_screens/signIn/controllers/signInController.dart';
import 'package:go_connect/auth_screens/verificationforAccount/controllers/verificationforAccountController.dart';

class Authbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountcontroller());
    Get.lazyPut(() => Signincontroller());
    Get.lazyPut(() => Verificationforaccountcontroller());
    Get.lazyPut(() => Forgetpasswordcontroller());
    Get.lazyPut(() => Forgetpasswordotpcontroller());
    Get.lazyPut(() => Resetpasswordcontroller());
  }
}
