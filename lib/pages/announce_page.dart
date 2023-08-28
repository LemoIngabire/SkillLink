import 'package:flutter/material.dart';
class AnnouncePage extends StatelessWidget{
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.deepOrange,
                                  size: 25,
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text('Announce now',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange
                                  ),),
                              ),
                            ]),
                      ]),
                ),
                const Padding(padding: EdgeInsets.all(10),
                  child: TextField(

                  ),
                ),

                Padding(padding: EdgeInsets.all(10),
                  child: SizedBox(width: double.infinity,
                    child: Material(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>AnnouncementPage(),),);
                        },
                        child:const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15,horizontal: 20),
                          child: Center(
                            child: Text('Send',style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white


                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        )
    );
  }
}