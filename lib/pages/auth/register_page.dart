import 'package:flutter/material.dart';
import 'package:skill_link/services/auth_services.dart';
import '../../helper/helper_function.dart';
import '../../model/user_model.dart';
import '../../widgets/Widgets.dart';
import '../das_page.dart';
import '../home_page.dart';
class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>_RegisterPage();
}
class _RegisterPage  extends State<RegisterPage> {

  final formKey = GlobalKey<FormState>();
  String regNo = "";
  String name = ""; // Define 'name' variable
  String email = "";
  String level = "";
  String department = "";
  String password = "";
  List<String> interest = [];
  List<Widget> interestFields = [];
  bool isLoading = false;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: Theme
              .of(context)
              .primaryColor,),) :
      SingleChildScrollView(
        child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),

            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Regitration form",
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 5,),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "RegNo",
                        ),
                        onChanged: (val) {
                          setState(() {
                            regNo = val;
                          });
                        },

                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return "RegNo cannot be empty";
                          }
                        }
                    ),

                    SizedBox(height: 5,),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "Name",
                        ),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },

                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return "Name cannot be empty";
                          }
                        }
                    ),

                    SizedBox(height: 5,),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: "Email",
                      ),
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


                    SizedBox(height: 5,),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "Level",
                        ),
                        onChanged: (val) {
                          setState(() {
                            level = val;
                          });
                        },

                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return "Level cannot be empty";
                          }
                        }
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "Department",
                        ),
                        onChanged: (val) {
                          setState(() {
                            department = val;
                          });
                        },

                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return "Department cannot be empty";
                          }
                        }
                    ),

                    const SizedBox(height: 5,),
                    TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                          labelText: "Password",
                        ),
                        validator: (val) {
                          if (val!.length < 8) {
                            return "Password must be at least 8 characters";
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
                          "Register",
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          register();
                        },
                      ),
                    ),
                  ]
              ),
            )
        ),
      ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final registrationResult = await authService
          .registerUserWithEmailandPassword(
        name,
        regNo,
        email,
        level,
        department,
        password,
        interest,
      );
      if (registrationResult == true) {
        //saving the shared preference state
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserNameSF(name);
        await HelperFunctions.saveUserRegNoSF(regNo);
        await HelperFunctions.saveUserEmailSF(email);
        await HelperFunctions.saveUserLevelSF(level);
        await HelperFunctions.saveUserDepartmentSF(department);
        nextScreenReplace(context, HomePage());
      } else {
        showSnackbar(context, Colors.red, registrationResult);
        setState(() {
          isLoading = false;
        });
      }
    }
    void addInterestField() {
      setState(() {
        interestFields.add(
          TextFormField(
            decoration: textInputDecoration.copyWith(
              labelText: "Interest",
            ),
            onChanged: (val) {
              setState(() {
                interest.add(val);
              });
            },
          ),
        );
      });
    }
  }
}
