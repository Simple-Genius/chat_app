import 'package:chat_app/app/modules/login/views/login_view.dart';
import 'package:chat_app/app/modules/widgets/details_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome\nUser',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xff999999),
                        radius: 60,
                      ),
                      Positioned(
                        left: 80,
                        bottom: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_a_photo),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign up to join',
                style: TextStyle(color: Color.fromARGB(255, 146, 141, 141)),
              ),
              const SizedBox(height: 30),
              DetailsFeild(
                hintText: 'name',
                controller: controller.nameController,
              ),
              const SizedBox(height: 10),
              DetailsFeild(
                hintText: 'phone',
                controller: controller.phoneController,
              ),
              const SizedBox(height: 10),
              DetailsFeild(
                hintText: 'email',
                controller: controller.emailController,
              ),
              const SizedBox(height: 10),
              DetailsFeild(
                hintText: 'password',
                controller: controller.passwordController,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.checkBoxValue.value,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        controller.checkBoxValue.value =
                            !controller.checkBoxValue.value;
                      },
                      shape: const CircleBorder(),
                    ),
                  ),
                  const Text('I agree to the'),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Terms of Service',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have an account?'),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const LoginView());
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => Align(
                  child: ElevatedButton(
                      onPressed: () {
                        controller.signUp();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 160),
                      ),
                      child: controller.isLoading.value == false
                          ? const Text('Sign Up')
                          : const CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: Colors.white,
                            ))))
            ],
          ),
        ));
  }
}
