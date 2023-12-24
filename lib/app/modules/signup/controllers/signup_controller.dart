import 'package:chat_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:chat_app/app/modules/home/views/home_view.dart';
import 'package:chat_app/app/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final count = 0.obs;
  RxBool checkBoxValue = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void signUp() async {
    isLoading.value = true;
    User? user = await authService.signUpWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null) {
      print('User has been created successfully');
      Get.to(() => DashboardView());
      isLoading.value = false;
    }
  }

  void increment() => count.value++;
}
