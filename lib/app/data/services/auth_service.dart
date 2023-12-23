import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Rxn<User?> user = Rxn<User?>();

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({'uId': userCredential.user!.uid, 'email': email});
      return userCredential.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  void signOut() {
    _auth.signOut();
  }
}
