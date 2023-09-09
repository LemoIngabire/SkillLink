import 'package:firebase_auth/firebase_auth.dart';
import '../helper/helper_function.dart';
import 'database_services.dart';
class AuthService{
  final FirebaseAuth firebaseAuth =FirebaseAuth.instance;

// register
Future registerUserWithEmailandPassword(
    String regNo,String fullName,String email,String level, String department, String password) async {
  try {
    User user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password))
        .user!;

    if (user != null) {
      // call our database service to update the user data.
      await DatabaseService(uid: user.uid).savingUserData(fullName,regNo,level,department, email);
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