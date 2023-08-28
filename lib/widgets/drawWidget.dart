import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
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
              color: Colors.deepOrange,
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
              color: Colors.deepOrange,
            ),
            title: Text('setting',
              style: TextStyle(
                  fontSize:10,
                  fontWeight: FontWeight.bold
              ),),
          ),

          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.deepOrange,
            ),
            title: Text('log out',
              style: TextStyle(
                  fontSize:10,
                  fontWeight: FontWeight.bold
              ),),
          )
        ]),
    );
  }
}