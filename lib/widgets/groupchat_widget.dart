import'package:flutter/material.dart';
class GroupChat extends StatefulWidget {
  @override
  State<GroupChat> createState() => _GroupChat();

}

class _GroupChat extends State<GroupChat>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Groups',)
      ),
    );
  }
}