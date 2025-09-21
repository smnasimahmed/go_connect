import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountcontroller extends GetxController {
   TextEditingController nameTextController = TextEditingController();
   TextEditingController emailTextController = TextEditingController();
   TextEditingController passwordTextController = TextEditingController();
   TextEditingController confirmpasswordTextController =
      TextEditingController();
  GlobalKey<FormState> createAccountValidKey = GlobalKey<FormState>();

  void onAppInitialDataLoad(){
    try {
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    confirmpasswordTextController =
      TextEditingController();
    } catch (e) {
      
    }
  }
  void disposeFunc() {
    try {
      nameTextController.dispose();
      emailTextController.dispose();
      passwordTextController.dispose();
      confirmpasswordTextController.dispose();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    onAppInitialDataLoad();
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
    disposeFunc();
  }


}
