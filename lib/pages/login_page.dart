import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_link/pages/reset_page.dart';
import 'package:skill_link/widgets/navbar_root.dart';
import 'das_page.dart';
class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() =>_LoginPage();

}

class _LoginPage  extends State<LoginPage>{
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
                  child: Text('Log In Here',
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
                        label:Text('Enter Username'),
                        prefixIcon: Icon(Icons.person)
                    ),
                  ),),
                SizedBox(height: 5,),
                Padding(padding: EdgeInsets.all(12),
                  child: TextField(
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label:Text('Enter Password'),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: (){
                              if(passToggle==true){
                                passToggle= false;
                              }
                              else{
                                passToggle=true;
                              }
                              setState(() {

                              });
                            },
                            child: passToggle ?
                            Icon(CupertinoIcons.eye_slash_fill) :
                            Icon(CupertinoIcons.eye_fill)
                        )
                    ),
                  ),
                ),

                  Padding(padding: EdgeInsets.symmetric(vertical: 15),
                    child:Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBarRoots(),),);
                        },
                          child: Text('Student',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,

                            ),
                          ),
                        ),
                        TextButton(onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>DasPage(),),);
                        },
                          child: Text('DAS',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange
                            ),
                          ),
                        ),
                      ]),),
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
                            child: Text('Log In',style: TextStyle(
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
                SizedBox(height: 5,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Forgot password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPage(),),);
                      },
                        child: Text('reset',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 5,),
                // MyButton(
                //   onTap: SignUserIn(),
                // ),
                const SizedBox(height: 5,),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(child:
                        Divider(
                          thickness: 0.5,
                          color: Colors.orangeAccent,
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child:
                          Text('or continue with'
                          ),
                        ),
                        Expanded(child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/google.png',height: 72,
                    )
                  ],
                ),
              ],),
          ),
        )
    );
  }
}