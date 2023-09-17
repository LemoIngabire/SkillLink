import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../helper/helper_function.dart';
import '../model/user_model.dart';
import 'database_services.dart';
class AuthService{
  final FirebaseAuth firebaseAuth =FirebaseAuth.instance;

// register
Future registerUserWithEmailandPassword(
    String regNo,String Name,String email,String level, String department, String password, List<String> interest) async {
  try {
    User user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password))
        .user!;

    if (user != null) {
      // call our database service to update the user data.
      await DatabaseService(uid: user.uid).savingUserData(Name,regNo,email,level,department,interest);
      return true;
    }
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}
// login
  Future loginWithUserNameandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

// signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserRegNoSF("");
      await HelperFunctions.saveUserNameSF("");
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserLevelSF("");
      await HelperFunctions.saveUserDepartmentSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
class FirebaseService {
  static Future<void> addInterest(String interest) async {
    try {
      // Replace 'yourUserId' with the actual user's ID
      String userId = 'yourUserId';

      // Update the interests in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({
        'interests': FieldValue.arrayUnion([interest]),
      });
    } catch (error) {
      // Handle errors
      print('Error adding interest: $error');
    }
  }
}