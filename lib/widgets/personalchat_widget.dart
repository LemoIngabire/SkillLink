import'package:flutter/material.dart';
class PersonalChat extends StatefulWidget {
  @override
  State<PersonalChat> createState() => _PersonalChat();

}

class _PersonalChat extends State<PersonalChat>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Chats',)
      ),
    );
  }
}