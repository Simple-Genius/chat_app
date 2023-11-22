import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

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
            height: 100,
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
          TextFormField(
            cursorColor: Color.fromARGB(255, 143, 138, 138),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                filled: true,
                fillColor: Color.fromARGB(255, 187, 184, 201),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    ));
  }
}
