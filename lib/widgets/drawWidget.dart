import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
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