import 'package:flutter/material.dart';
import 'package:skill_link/pages/report_page.dart';
import 'announce_page.dart';
import 'auth/register_page.dart';
class DasPage extends StatelessWidget{
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
                                child: Text('Welcome here!',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange
                                  ),),
                              ),
                            ]),
                      ]),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage(),),);
                        },
                          child: const Text('Registering students',
                          ),
                        ),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportedPage(),),);
                        },
                          child: Text('Reported Students',

                          ),
                        ),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AnnouncePage(),),);
                        },
                          child: Text('Announcements',

                          ),
                        ),
                      ]),
                ),
              ]),
        )


    );
  }
}