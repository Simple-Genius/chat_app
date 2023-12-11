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
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffE7EAED),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hello how are you',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF2B3594),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hello how are you',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  //hintText: ,
                  fillColor: const Color.fromARGB(255, 187, 184, 201),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            )
          ],
        ),
      )),
    );
  }
}
