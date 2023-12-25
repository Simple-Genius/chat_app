import 'package:chat_app/app/modules/widgets/sender_text.dart';
import 'package:chat_app/app/modules/widgets/user_text.dart';
import 'package:chat_app/app/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatView extends GetView {
  ChatView(this.receiverId, this.recieverEmail, {Key? key}) : super(key: key);
  final String receiverId;
  final String recieverEmail;
  final TextEditingController messageController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Widget buildMessage(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (snapshot.data() != null) {
      print("-------Data is available---------");
      var message = data['senderId'] == firebaseAuth.currentUser!.uid
          ? UserText(message: messageController.text)
          : SenderText(message: data['messages']);
      return message;
    }

    return Text('------data is unavailable');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recieverEmail),
        backgroundColor: const Color(0xFF2B3594),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StreamBuilder(
                  stream: chatService.getMessages(
                      receiverId, firebaseAuth.currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child:
                            Text('Could not load messages\n${snapshot.error}'),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    print("--------------------------------------------");
                    return ListView(
                      children: snapshot.data!.docs
                          .map((document) => buildMessage(document))
                          .toList(),
                    );
                  },
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  hintText: "Type a message",
                  prefixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.emoji_emotions)),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.attach_file)),
                      IconButton(
                          onPressed: () async {
                            if (messageController.text.isNotEmpty) {
                              await chatService.sendMessage(
                                  receiverId, messageController.text);
                              messageController.clear();
                            }
                          },
                          icon: const Icon(Icons.keyboard_voice))
                    ],
                  ),
                  fillColor: const Color.fromARGB(255, 187, 184, 201),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
          )
        ],
      ),
    );
  }
}
