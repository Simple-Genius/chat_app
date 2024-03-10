import 'package:chat_app/app/modules/dashboard/views/chat_view.dart';
import 'package:chat_app/app/modules/widgets/bottom_nav_bar.dart';
import 'package:chat_app/app/modules/widgets/chatItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

// ignore: must_be_immutable
class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  buildChatItem(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (firebaseAuth.currentUser?.email == data['email']) {
      return Container();
    }
    return ChatItem(
      recieverEmail: data['email'],
      lastMessage: 'lastMessage',
      recieverId: data['uId'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2B3594),
          leading: IconButton(
            icon: const Icon(Icons.format_align_left),
            onPressed: () {},
          ),
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavBar(
          pageNumber: 0,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Could not load messages\n${snapshot.error}'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return ListView(
              children: snapshot.hasData
                  ? snapshot.data!.docs
                      .map<Widget>((doc) => buildChatItem(doc))
                      .toList()
                  : [],
            );
          },
        ));
  }
}
