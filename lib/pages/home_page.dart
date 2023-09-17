import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_link/pages/profile_page.dart';
import 'package:skill_link/pages/search_page.dart';
import 'package:skill_link/services/auth_services.dart';
import '../helper/helper_function.dart';
import '../services/database_services.dart';
import '../widgets/Widgets.dart';
import '../widgets/groupchat_widget.dart';
import '../widgets/personalchat_widget.dart';
import 'auth/login_page.dart';
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String regNo = "";
  String userName = "";
  String email = "";
  String level = "";
  String department = "";
   List interest = [];
   Stream? users;
  AuthService authService= AuthService();


  int _currentIndex = 0;
  final _chatWidgets = [
    PersonalChat(),
    GroupChat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "SkillLink",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: _chatWidgets[_currentIndex], // Display the selected view
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Change the selected view
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: "Groups",
            ),
          ],
        ),
    );
  }
}






















//     return Scaffold(
//         body: ListView(
//             children: [
//               AppBarWidget(),
//               Padding(padding:
//               EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 2,
//                           blurRadius: 10,
//                           offset: Offset(0,3),
//                         )
//                       ]
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       children: [
//                         Container(
//                           height:70 ,
//                           width: 250,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 15),
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(Icons.search),
//                                 hintText: 'Search ',
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               ])
//     );}
// }