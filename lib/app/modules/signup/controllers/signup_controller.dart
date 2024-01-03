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
      print('User has been created successfully');
      Get.to(() => DashboardView());
      isLoading.value = false;
    }
  }
}
