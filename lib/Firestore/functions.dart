import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
    Future<User> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }
  uploadUserInfo(String uid, Map userInfo) async {
    print('$uid');
    await FirebaseFirestore.instance.collection("users").doc(uid).set(userInfo);
  }

  Future updateInfo(String uid, String date, String city) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update({
      "DOB": date,
      "city": city,
    }).catchError((error) {
      print(error);
    });
  }
}
