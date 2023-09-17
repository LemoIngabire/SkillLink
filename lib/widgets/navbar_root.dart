import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_link/pages/home_page.dart';
import 'package:skill_link/pages/chat_page.dart';
class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRoots();
}

class _NavBarRoots extends State<NavBarRoots>{
  int _selectedIndex= 0;
  final _screens =[
    //home screen
    HomePage(),
  //message screen
   // ChatPage(groupId: '', groupName: '', fullName: '',),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),
              label: 'Home'
            ),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                label: 'Chat'
            ),
          ],
        ),

      ),

    );
  }

}