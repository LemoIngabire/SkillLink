import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");
  final CollectionReference chatsCollection =
  FirebaseFirestore.instance.collection("chats");
  final CollectionReference groupCollection =
  FirebaseFirestore.instance.collection("groups");

//saving the userdata
  Future savingUserData(String regNo,String fullName, String email,String level, String department) async {
    return await userCollection.doc(uid).set({
      "regNo":regNo,
      "fullName": fullName,
      "email": email,
      "level":level,
      "department":department,
      "chats":[],
      "groups": [],
      "profilePic": "",
      "uid": uid,
    });
  }

  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
    await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}