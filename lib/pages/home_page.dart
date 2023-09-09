import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_link/pages/search_page.dart';
import 'package:skill_link/services/auth_services.dart';
import '../helper/helper_function.dart';
import '../widgets/Widgets.dart';
import '../widgets/appbarwidget.dart';
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String regNo = "";
  String fullName = "";
  String email = "";
  String level = "";
  String department = "";
  String password = "";
  AuthService authService= AuthService();
  bool _isLoading =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserData();
  }
  gettingUserData() async {
    await HelperFunctions.getUserRegNoFromSF().then((value) {
      setState(() {
        regNo = value!;
      });
    });

    await HelperFunctions.getUserNameFromSF().then((value) {
      setState(() {
        fullName = value!;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  nextScreen(context, const SearchPage());
                },
                icon: const Icon(
                  Icons.search,
                ))
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          title: const Text(
            "SkillLink"
                "",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
          ),
        ),
        drawer: Drawer(
          child: ListView(
              children: const [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    accountName: Text('Programer'),
                    accountEmail: Text('Programer@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('images/me.jpg'),
                    ),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    CupertinoIcons.person,
                    color: Colors.blue,
                  ),
                  title: Text('My Profile',
                    style: TextStyle(
                        fontSize:10,
                        fontWeight: FontWeight.bold
                    ),),
                ),

                ListTile(
                  leading: Icon(
                    CupertinoIcons.settings,
                    color: Colors.blue,
                  ),
                  title: Text('setting',
                    style: TextStyle(
                        fontSize:10,
                        fontWeight: FontWeight.bold
                    ),),
                ),

                ListTile(
                  onTap:()async{
                    authService.signOut().then(){
                      nextScreenReplace(context, LoginPage());
                    };
                  }
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.blue,
                  ),
                  title: Text('log out',
                    style: TextStyle(
                        fontSize:10,
                        fontWeight: FontWeight.bold
                    ),),
                )
              ]),
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