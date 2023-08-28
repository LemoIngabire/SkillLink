import 'package:flutter/material.dart';
class ReportedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child: Column(
        children: [
        SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.deepOrange,
                            size: 25,
                          ),
                        ),

         Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
             child: Text('Reported students',
               style: TextStyle(
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
                 color: Colors.deepOrange
               ),),
         ),
                      ]),
                ]),
          ),
        ]),
        )
    );
  }}
