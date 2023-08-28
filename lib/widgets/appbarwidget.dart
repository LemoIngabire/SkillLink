import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_link/pages/announcement_page.dart';

class AppBarWidget extends StatelessWidget{
  final GlobalKey<ScaffoldState> scaffoldKey;
  AppBarWidget({required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.symmetric(vertical:15, horizontal: 15 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0,3),
                ),
               ]
              ),
              child: Icon(CupertinoIcons.bars),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AnnouncementPage(),),);

            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  ),
                  ]
              ),
                child: Icon(Icons.notifications),
            ),
          )
        ],
      ),
    );

  }



}