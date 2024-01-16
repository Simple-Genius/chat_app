import 'dart:typed_data';

import 'package:chat_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:chat_app/app/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  RxBool checkBoxValue = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  Rx<Uint8List> newImage = Uint8List(0).obs;

  @override
  void onInit() {
    super.onInit();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    newImage.value = image;
  }

  pickImage(ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: imageSource);
    if (file != null) {
      return await file.readAsBytes();
    }
  }

  void signUp() async {
    isLoading.value = true;
    User? user = await authService.signUpWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null) {
      Get.to(() => DashboardView());
      isLoading.value = false;
    }
  }

  final text =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam gravida libero nec ante dignissim commodo. Vivamus in elit porta, hendrerit enim non, fringilla ipsum. Sed diam mi, congue a malesuada sit amet, pharetra ut felis. Donec nunc diam, molestie interdum magna a, gravida pharetra ante. In odio velit, malesuada sollicitudin dapibus sit amet, consectetur at libero. Vestibulum dictum fringilla mollis. Nulla facilisis massa ipsum, sit amet tincidunt ligula finibus nec. Sed venenatis finibus eleifend. In in lorem in mi pretium luctus non sit amet enim. Praesent egestas eget libero in congue. Vivamus id tempor nulla. Praesent gravida id tortor ac fringilla.Nunc nisi ipsum, porta vel fermentum a, suscipit et erat. Donec eu dui at lorem tristique lacinia. Mauris eleifend, diam ac sollicitudin tempor, enim nunc posuere augue, quis facilisis massa sapien sed mi. Ut tincidunt auctor ligula a cursus. Vestibulum quis ullamcorper quam. Nunc ullamcorper mauris nec nunc elementum, eu ullamcorper ipsum sodales. Curabitur et mauris eget magna luctus porta nec eu mi.';
}
