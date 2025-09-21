import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signincontroller extends GetxController {
  TextEditingController signInEmailTextController =
      TextEditingController();
  TextEditingController signInPasswordTextController =
      TextEditingController();

  GlobalKey<FormState> signInValidKey = GlobalKey<FormState>();

  void onAppInitialDataLoad() {
    signInEmailTextController = TextEditingController();
    signInPasswordTextController = TextEditingController();
  }

  void disposeFunc() {
    signInEmailTextController.dispose();
    signInPasswordTextController.dispose();
  }

  @override
  void onInit() {
    onAppInitialDataLoad();
    super.onInit();
  }

  @override
  void dispose() {
    disposeFunc();
    super.dispose();
  }
}
