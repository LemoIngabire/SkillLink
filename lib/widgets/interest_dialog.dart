import 'package:flutter/material.dart';

import '../services/auth_services.dart';
import '../services/database_services.dart'; // Import your Firestore service

class InterestDialog extends StatefulWidget {
  @override
  _InterestDialogState createState() => _InterestDialogState();
}

class _InterestDialogState extends State<InterestDialog> {
  String newInterest = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Interest'),
      content: TextField(
        onChanged: (value) {
          setState(() {
            newInterest = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Enter your interest',
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Add'),
          onPressed: () async {
            // Call a function from your Firestore service to add the interest
            await FirebaseService.addInterest(newInterest);

            // Close the dialog
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}