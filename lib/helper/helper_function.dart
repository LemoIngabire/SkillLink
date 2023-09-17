   import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {

     //keys
     static String userLoggedInKey = "LOGGEDINKEY";
     static String userNameKey = "USERNAMEKEY";
     static String userEmailKey = "USEREMAILKEY";
     static String userRegNoKey = "USERREGNOKEY";
     static String userDepartmentKey = "USERDEPARTMENTKEY";
     static String userLevelKey = "USERLEVELKEY";
     static String userInterestKey = "USERINTERESTKEY";
// saving the data to SF

     static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return await sf.setBool(userLoggedInKey, isUserLoggedIn);
     }

     static Future<bool> saveUserNameSF(String userName) async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return await sf.setString(userNameKey, userName);
     }
     static Future<bool> saveUserRegNoSF(String userRegNo) async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return await sf.setString(userRegNoKey, userRegNo);
     }

     static Future<bool> saveUserEmailSF(String userEmail) async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return await sf.setString(userEmailKey, userEmail);
     }

     static Future<bool> saveUserLevelSF(String userLevel) async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return await sf.setString(userLevelKey, userLevel);
     }

     static Future<bool> saveUserDepartmentSF(String userDepartment) async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return await sf.setString(userDepartmentKey, userDepartment);
     }
     static Future<bool> saveUserInterestSF(String userInterest) async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return await sf.setString(userInterestKey, userInterest);
     }


     //getting data from SF
     static Future<bool?> getUserLoggedInStatus() async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return sf.getBool(userLoggedInKey);
     }
     static Future<String?> getUserEmailFromSF() async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return sf.getString(userEmailKey);
     }

     static Future<String?> getUserNameFromSF() async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return sf.getString(userNameKey);
     }
     static Future<String?> getUserRegNoFromSF() async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return sf.getString(userRegNoKey);
     }

     static Future<String?> getUserLevelFromSF() async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return sf.getString(userLevelKey);
     }

     static Future<String?> getUserDepartmentFromSF() async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          return sf.getString(userDepartmentKey);
     }

  static getUserInterestFromSF() async{
       SharedPreferences sf = await SharedPreferences.getInstance();
       return sf.getString(userInterestKey);

  }

}