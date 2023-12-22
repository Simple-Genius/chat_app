import 'package:chat_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:chat_app/app/modules/home/views/home_view.dart';
import 'package:chat_app/app/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final count = 0.obs;
  RxBool checkBoxValue = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void signUp() async {
    User? user = await authService.signUpWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null) {
      print('User has been created successfully');
      Get.to(() => DashboardView());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
