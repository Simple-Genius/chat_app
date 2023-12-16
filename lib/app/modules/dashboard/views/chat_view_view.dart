import 'package:chat_app/app/modules/widgets/sender_text.dart';
import 'package:chat_app/app/modules/widgets/user_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatViewView extends GetView {
  const ChatViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claude Castro'),
        backgroundColor: Color(0xFF2B3594),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SenderText(),
                  UserText(),
                ],
              ),
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: TextField(
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
                          onPressed: () {}, icon: Icon(Icons.keyboard_voice))
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
