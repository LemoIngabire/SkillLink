import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:skill_link/services/database_services.dart';
import '../helper/helper_function.dart';
import '../pages/auth/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/search_page.dart';
import '../services/auth_services.dart';
import 'Widgets.dart';
import 'user_tile.dart';
class PersonalChat extends StatefulWidget {
  const PersonalChat({super.key});

  @override
  State<PersonalChat> createState() => _PersonalChat();

}

class _PersonalChat extends State<PersonalChat>{
  String regNo = "";
  String userName = "";
  String email = "";
  String level = "";
  String department = "";
  AuthService authService = AuthService();
Stream? users;
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserData();
  }

  // string manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }


  gettingUserData() async {
    await HelperFunctions.getUserRegNoFromSF().then((value) {
      setState(() {
        regNo = value!;
      });
    });

    await HelperFunctions.getUserNameFromSF().then((value) {
      setState(() {
        userName = value!;
      });
    });
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });

    await HelperFunctions.getUserLevelFromSF().then((value) {
      setState(() {
        level = value!;
      });
    });

    await HelperFunctions.getUserDepartmentFromSF().then((value) {
      setState(() {
        department = value!;
      });
    });
    //getting the list of snapshots in our stream
    await DatabaseService (uid: FirebaseAuth.instance.currentUser!.uid).getUsers().then((snapshot){
      setState(() {
        users=snapshot ;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                nextScreenReplace(context, const SearchPage());
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "chats",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),

      drawer: Drawer(
          child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 50),
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.grey[700],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  userName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  height: 2,
                ),
                ListTile(
                  onTap: () {},
                  selectedColor: Theme.of(context).primaryColor,
                  selected: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.home_filled),
                  title: const Text(
                    "home",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {
                    nextScreenReplace(
                        context,
                        ProfilePage(
                          userName: userName,
                          email: email,
                          regNo: regNo,
                          level: level,
                          department: department,
                          interestsList: [],
                        ));
                  },
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.person),
                  title: const Text(
                    "Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Logout"),
                            content: const Text("Are you sure you want to logout?"),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await authService.signOut();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                          (route) => false);
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ])
      ),
      body: userList(),
    );
  }
  userList(){
    return StreamBuilder(stream: users,
        builder: (context,AsyncSnapshot snapshot){
      // make some checks
      if(snapshot.hasData){
        if(snapshot.data['users']!=null){
          return ListView.builder(
              itemCount: snapshot.data['users'].length,
              itemBuilder: (context, index) {
            int reverseIndex = snapshot.data['users'].length - index - 1;
            return UserTile(
                uid: getId(snapshot.data['users'][reverseIndex]),
                userName: getName(snapshot.data['users'][reverseIndex]),
            );
              }
          );
        }else{
          return noUserWidget();
        }
      }
      else{
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        );
      }
    });
  }
  noUserWidget(){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
    child: const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:[SizedBox(
    height: 20,
    ),
   Text(
    "There is no user with that kind of skills.",
    textAlign: TextAlign.center,
    )
    ])
    );
  }
  }
