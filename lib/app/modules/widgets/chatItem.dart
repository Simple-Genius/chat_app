import 'package:chat_app/app/modules/dashboard/views/chat_view_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.recieverEmail,
    required this.lastMessage,
  });
  final String recieverEmail;
  final String lastMessage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ChatView(recieverEmail, lastMessage)),
      child: Padding(
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
                    recieverEmail,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    lastMessage,
                    style: TextStyle(color: Color.fromARGB(255, 123, 118, 118)),
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
      ),
    );
  }
}
