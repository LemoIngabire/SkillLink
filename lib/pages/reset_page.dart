import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget{
  @override
  State<ResetPage> createState() =>_ResetPage();

}

class _ResetPage  extends State<ResetPage>{
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10,),
                const Padding(padding: EdgeInsets.all(5),
                  child: Text('Reset your password',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                const Padding(padding: EdgeInsets.all(12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label:Text('Enter email'),
                        prefixIcon: Icon(Icons.person)
                    ),
                  ),),
                SizedBox(height: 5,),
                Padding(padding: EdgeInsets.all(12),
                  child: TextField(
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label:Text('Enter new Password'),
                        prefixIcon: Icon(Icons.lock),

                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.all(10),
                  child: SizedBox(width: double.infinity,
                    child: Material(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),),);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15,horizontal: 40),
                          child: Center(
                            child: Text('Reset',style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


              ],),
          ),
        )
    );
  }
}