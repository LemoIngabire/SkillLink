import 'package:flutter/material.dart';
import 'package:skill_link/pages/chat_page.dart';
import 'login_page.dart';
class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
            children: [
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(),),);
                  },
                  child: Text('Skip',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20
                    ),),
                ),
              ),
              SizedBox(height: 5,),
              Padding(padding: EdgeInsets.all(5),
                child: Image.asset('images/natural.jpg',height: 250,),),
              SizedBox(height: 15),
              Text('Seek help from peers',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    wordSpacing: 2
                ),),
              SizedBox(height: 10,),
              Text('Get and Give',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    wordSpacing: 2
                ),),
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(),),);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15,horizontal: 40),
                        child: Text('Start'),

                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }

}