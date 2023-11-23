import 'package:chat_app/app/modules/login/controllers/login_controller.dart';
import 'package:chat_app/app/modules/signup/views/signup_view.dart';
import 'package:chat_app/app/modules/widgets/details_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
          ),
          Text(
            'Welcome\nBack',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Sign in to continue',
            style: TextStyle(color: const Color.fromARGB(255, 146, 141, 141)),
          ),
          SizedBox(height: 30),
          DetailsFeild(),
          SizedBox(height: 10),
          DetailsFeild(),
          SizedBox(height: 40),
          Align(
              child: Text(
            'Forgot Password?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          )),
          SizedBox(height: 30),
          Align(
            child: OutlinedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 90)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  side: MaterialStateProperty.all(BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                      style: BorderStyle.solid))),
              onPressed: () {},
              child: Text(
                'Sign in with Facebook',
                style: TextStyle(
                    color: Color.fromARGB(255, 17, 120, 210), fontSize: 17),
              ),
            ),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create new account?'),
              TextButton(
                  onPressed: () {
                    Get.to(() => SignupView());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
          SizedBox(height: 10),
          Align(
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 160),
                  ),
                  child: Text('Login')))
        ],
      ),
    ));
  }
}
