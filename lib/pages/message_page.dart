import 'package:flutter/material.dart';
import 'package:skill_link/pages/home_page.dart';
class Messagepage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),

        child: AppBar(
          backgroundColor: Colors.deepOrange,
          leadingWidth: 30,
          title: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('images/mi.jpg'),

                ),
                Padding(padding: EdgeInsets.only(left: 10),
                  child: Text('Dr Doctor name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),),)
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 8,right: 10),
              child: Icon(Icons.call,
                color: Colors.white,
                size: 16,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8,right: 10),
              child: Icon(Icons.video_call,
                color: Colors.white,
                size: 16,),),
            Padding(padding: EdgeInsets.only(top: 8,right: 10),
              child: Icon(Icons.more_vert,
                color: Colors.white,
                size: 16,),)
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(top: 20,left: 15,right: 15),
        itemBuilder: (context, index)=>HomePage(),
      ),
      bottomSheet: Container(
        height: 65,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width /1.6,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Message',
                      border: InputBorder.none
                  ),
                ),
              ),),
            Spacer(),
            Padding(padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.send,
                size: 30,
                color: Colors.deepOrange,),)
          ],
        ),

      ),

    );
  }}