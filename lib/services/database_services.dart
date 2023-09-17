import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
  FirebaseFirestore.instance.collection("groups");

  //saving the userdata
  Future savingUserData(String regNo,String name, String email, String level, String department, List<String> interest) async {
    return await userCollection.doc(uid).set({
      "uid": uid,
      "profilePic": "",
      "regNo":regNo,
      "name": name,
      "email": email,
      "level":level,
      "department":department,
      "groups": [],
      "users":[],
      "interests": interest,
    });
  }
  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
    await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
  // get users
  getUsers() async {
    return userCollection.doc(uid).snapshots();
  }
// creating a group
//   Future createGroup(String userName, String id, doc) async {
//     DocumentReference userDocumentReference = await userCollection.add({
//       "userName": userName,
//       "groupIcon": "",
//       "admin": "${id}_$userName",
//       "members": [],
//       "uid": "",
//       "recentMessage": "",
//       "recentMessageSender": "",
//     });
//     // update the members
//     await userDocumentReference.update({
//       "members": FieldValue.arrayUnion(["${uid}_$userName"]),
//       "uid": userDocumentReference.id,
//     });
//
//    // DocumentReference userDocumentReference = userCollection.doc(uid);
//     return await userDocumentReference.update({
//       "users":
//       FieldValue.arrayUnion(["${userDocumentReference.id}_$userName"])
//     });
//   }
  // getting the chats
  getChats(String uid) async {
    return userCollection
        .doc(uid)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }
  // Future getGroupAdmin(String uid) async {
  //   DocumentReference d = groupCollection.doc(uid);
  //   DocumentSnapshot documentSnapshot = await d.get();
  //   return documentSnapshot['admin'];
  // }
  // get chat members
  getChatMembers(uid) async {
    return userCollection.doc(uid).snapshots();
  }

  // search
  searchByName(String name) {
    return userCollection.where("name", isEqualTo: name).get();
  }

  // function -> bool
  Future<bool> isUserSelected(
      String userName, String uid) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> users = await documentSnapshot['users'];
    if (users.contains("${uid}_$userName")) {
      return true;
    } else {
      return false;
    }
  }
  // toggling the group join/exit
  Future toggleUserSelected(
      String uid, String userName) async {
    // doc reference
    DocumentReference userDocumentReference = userCollection.doc(uid);
   // DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> users = await documentSnapshot['users'];

    // if user has our groups -> then remove then or also in other part re join
    if (users.contains("${uid}_$userName")) {
      await userDocumentReference.update({
        "users": FieldValue.arrayRemove(["${uid}_$userName"])
      });
      // await userDocumentReference.update({
      //   "members": FieldValue.arrayRemove(["${uid}_$userName"])
      // });
    } else {
      await userDocumentReference.update({
        "users": FieldValue.arrayUnion(["${uid}_$userName"])
      });
      await userDocumentReference.update({
        "members": FieldValue.arrayUnion(["${uid}_$userName"])
      });
    }
  }
  // send message
  sendMessage(String uid, Map<String, dynamic> chatMessageData) async {
    userCollection.doc(uid).collection("messages").add(chatMessageData);
    userCollection.doc(uid).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
  }
}