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
        bottomNavigationBar: BottomNavBar(
          pageNumber: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Todd Peterson',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'When are you coming home?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 123, 118, 118)),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text('08:13',
                      style:
                          TextStyle(color: Color.fromARGB(255, 123, 118, 118))),
                )
              ],
            ),
          ),
        ));
  }
}
