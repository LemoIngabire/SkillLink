import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>_RegisterPage();
}
class _RegisterPage  extends State<RegisterPage>{

  TextEditingController nameController = TextEditingController();
  TextEditingController regController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration form'),),
        body: Container(
          child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 10,),
                TextField(
                  controller: departmentController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Department'
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: levelController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Level'
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email'
                  ),
                ),

                const SizedBox(height: 10,),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name'
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: regController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'RegNo'
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: genderController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Gender'
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),),);
                },
                  child: Text('Register',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                // print(),
              ]
          ),
        )
    );
  }
}