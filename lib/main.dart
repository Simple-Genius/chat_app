import 'package:chat_app/app/data/services/auth_service.dart';
import 'package:chat_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  Get.put(SignupController());

  WidgetsFlutterBinding
      .ensureInitialized(); //tells Flutter not to start running the application widget code until the Flutter framework is completely booted. Firebase uses native platform channels, which require the framework to be running.

//sets up a connection between your Flutter app and your Firebase project. The DefaultFirebaseOptions.currentPlatform is imported from our generated firebase_options.dart file. This static value detects which platform you're running on,
//and passes in the corresponding Firebase keys.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync<AuthService>(() async => AuthService());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.SIGNUP,
      getPages: AppPages.routes,
    ),
  );
}
