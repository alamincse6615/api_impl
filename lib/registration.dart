import 'dart:convert';

import 'package:api_impl/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String pickedDate = "Choose date";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Center(
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Name'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Email'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Password'
                ),
              ),
            ),


            TextButton(onPressed: (){

              DatePicker.showDatePicker(
                context,
                minTime: DateTime(2000,01,01),
                maxTime: DateTime(2050,12,31),
                theme: DatePickerTheme(
                  headerColor: Colors.grey,
                  backgroundColor: Colors.green,

                ),
                onChanged: (date){
                  print(date);
                  pickedDate = date.toString();
                  setState(() {

                  });
                }

              );


            }, child: Text(pickedDate)),

            ElevatedButton(onPressed: (){
              registration();
            }, child: Text("Sign Up")),
            TextButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
            }, child: Text("Already an account? Loin In"))
          ],
        ),
      ),
    );
  }

  registration(){

    String name = nameController.text.toString();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString();






      var data  = {
      "name":name,
    "email":email,
    "password":password,
    "pickedDate":pickedDate,
    };


      print(jsonEncode(data));
      //jsonEncode(data);


  }
}
