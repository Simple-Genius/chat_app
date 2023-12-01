import 'package:chat_app/app/modules/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.format_align_left),
            onPressed: () {},
          ),
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Column(
          children: [],
        ));
  }
}
