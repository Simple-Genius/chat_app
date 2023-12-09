import 'package:chat_app/app/modules/home/views/home_view.dart';
import 'package:chat_app/app/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  void signIn() async {
    User? user = await authService.signInWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null) {
      Get.to(() => HomeView());
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
