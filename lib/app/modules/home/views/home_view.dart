import 'package:chat_app/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpeg"),
                  fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.3,
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enjoy the new Experience of chatting \n                 with friends',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Connect people around the world for free'),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const LoginView());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff223af2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 120.0, vertical: 15),
                        child: Text('Get Started'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
