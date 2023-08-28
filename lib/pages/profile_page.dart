import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() =>_ProfilePage();
}
class _ProfilePage  extends State<ProfilePage>{
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController regController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
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
                  controller: genderController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Gender'
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
                  controller: telephoneController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Telephone'
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: bioController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Bio'
                  ),
                ),

                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),),);
                },
                  child: Text('UPdate',style: TextStyle(
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