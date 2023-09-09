import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skill_link/pages/reset_page.dart';
import 'package:skill_link/services/auth_services.dart';
import 'package:skill_link/widgets/navbar_root.dart';
import '../../helper/helper_function.dart';
import '../../services/database_services.dart';
import '../../widgets/Widgets.dart';
import '../das_page.dart';
import '../home_page.dart';
class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() =>_LoginPage();

}

class _LoginPage  extends State<LoginPage> {
  //bool passToggle = true;
  final formKey = GlobalKey<FormState>();
  String password = "";
  String email ="";
  bool _isLoading = false;
  AuthService authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading ?
        Center(
          child:CircularProgressIndicator(
            color: Theme.of(context).primaryColor,),
          )
          :SingleChildScrollView(
        child:Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 60),

          child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "SkillLink",
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  const Text("Login here!",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400)),
                  //Image.asset("images/natural.jpg"),
                  SizedBox(height: 15,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        )),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    // check tha validation
                    validator: (val) {
                      return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          )),
                      validator: (val) {
                        if (val!.length < 8) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme
                              .of(context)
                              .primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        "Sign In",
                        style:
                        TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        login();
                      },
                    ),
                  ),
                ]),
          ),
        ),
        ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
          await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserRegNoSF(snapshot.docs[0]['regNo']);
          await HelperFunctions.saveUserNameSF(snapshot.docs[1]['fullName']);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserLevelSF(snapshot.docs[3]['level']);
          await HelperFunctions.saveUserDepartmentSF(snapshot.docs[4]['department']);
          nextScreenReplace(context,  HomePage());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
  }

















    // return Material(
    //     color: Colors.white,
    //     child: SingleChildScrollView(
    //       child: SafeArea(
    //         child: Column(
    //           children: [
    //             SizedBox(height: 10,),
    //             const Padding(padding: EdgeInsets.all(5),
    //               child: Text('Log In Here',
    //                 style: TextStyle(
    //                     color: Colors.deepOrange,
    //                     fontSize: 40,
    //                     fontWeight: FontWeight.bold
    //                 ),
    //                 ),
    //             ),
    //             SizedBox(height: 5,),
    //             const Padding(padding: EdgeInsets.all(12),
    //               child: TextField(
    //                 decoration: InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     label:Text('Enter Username'),
    //                     prefixIcon: Icon(Icons.person)
    //                 ),
    //               ),),
    //             SizedBox(height: 5,),
    //             Padding(padding: EdgeInsets.all(12),
    //               child: TextField(
    //                 obscureText: passToggle ? true : false,
    //                 decoration: InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     label:Text('Enter Password'),
    //                     prefixIcon: Icon(Icons.lock),
    //                     suffixIcon: InkWell(
    //                         onTap: (){
    //                           if(passToggle==true){
    //                             passToggle= false;
    //                           }
    //                           else{
    //                             passToggle=true;
    //                           }
    //                           setState(() {
    //
    //                           });
    //                         },
    //                         child: passToggle ?
    //                         Icon(CupertinoIcons.eye_slash_fill) :
    //                         Icon(CupertinoIcons.eye_fill)
    //                     )
    //                 ),
    //               ),
    //             ),
    //
    //               Padding(padding: EdgeInsets.symmetric(vertical: 15),
    //                 child:Center(
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     TextButton(onPressed: (){
    //                       Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBarRoots(),),);
    //                     },
    //                       child: Text('Student',
    //                         style: TextStyle(
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.orange,
    //
    //                         ),
    //                       ),
    //                     ),
    //                     TextButton(onPressed: (){
    //                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DasPage(),),);
    //                     },
    //                       child: Text('DAS',
    //                         style: TextStyle(
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.orange
    //                         ),
    //                       ),
    //                     ),
    //                   ]),),
    //             ),
    //             Padding(padding: EdgeInsets.all(10),
    //               child: SizedBox(width: double.infinity,
    //                 child: Material(
    //                   color: Colors.deepOrange,
    //                   borderRadius: BorderRadius.circular(10),
    //                   child: InkWell(
    //                     onTap: (){
    //                       //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),),);
    //                     },
    //                     child: Padding(
    //                       padding: EdgeInsets.symmetric(
    //                           vertical: 15,horizontal: 40),
    //                       child: Center(
    //                         child: Text('Log In',style: TextStyle(
    //                             fontSize: 22,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.white
    //                         ),),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 5,),
    //             Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text("Forgot password",
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w500,
    //                       color: Colors.black54,
    //                     ),),
    //                   TextButton(onPressed: (){
    //                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPage(),),);
    //                   },
    //                     child: Text('reset',
    //                       style: TextStyle(
    //                           fontSize: 18,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.orangeAccent
    //                       ),
    //                     ),
    //                   ),
    //                 ]),
    //             const SizedBox(height: 5,),
    //             // MyButton(
    //             //   onTap: SignUserIn(),
    //             // ),
    //             const SizedBox(height: 5,),
    //             const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
    //                 child: Row(
    //                   children: [
    //                     Expanded(child:
    //                     Divider(
    //                       thickness: 0.5,
    //                       color: Colors.orangeAccent,
    //                     ),
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.symmetric(horizontal: 8.0),
    //                       child:
    //                       Text('or continue with'
    //                       ),
    //                     ),
    //                     Expanded(child: Divider(
    //                       thickness: 0.5,
    //                       color: Colors.grey,
    //                     ),
    //                     ),
    //                   ],
    //                 )
    //             ),
    //             const SizedBox(height: 15,),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Image.asset('images/google.png',height: 72,
    //                 )
    //               ],
    //             ),
    //           ],),
    //       ),
    //     )
    // );
  //}
//}
