import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderEmail;
  final String senderId;
  final String recieverId;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.senderEmail,
      required this.senderId,
      required this.recieverId,
      required this.message,
      required this.timestamp});
  Map<String, dynamic> toMap() {
    return {
      'senderEmail': senderEmail,
      'senderId': senderId,
      'recieverId': recieverId,
      'message': message,
      'timestamp': timestamp
    };
  }
}
