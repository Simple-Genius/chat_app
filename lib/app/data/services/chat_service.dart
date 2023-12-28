import 'package:chat_app/app/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatService extends GetxService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(
    String recieverId,
    String message,
  ) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    final String currentUserEmail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderEmail: currentUserEmail,
        senderId: currentUserId,
        recieverId: recieverId,
        message: message,
        timestamp: timestamp);

    List<String> ids = [currentUserId, recieverId];
    ids.sort();
    final chatRoomId = ids.join('_');
    await firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // Future<List<Map<String, dynamic>>> getMessages(
  //     String receiverId, String senderId) async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
  //         .collection('messages')
  //         .where('receiverId', isEqualTo: receiverId)
  //         .where('senderId', isEqualTo: senderId)
  //         .orderBy('timestamp')
  //         .get();

  //     return querySnapshot.docs.map((doc) => doc.data()).toList();
  //   } catch (e) {
  //     print('Error fetching messages: $e');
  //     // Handle error appropriately, e.g., show an error message to the user
  //     return [];
  //   }
  // }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
