import 'dart:convert';

import 'package:api_impl/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';



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


  String gender="";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Center(
        child: ListView(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                 // hintText: 'Enter Your Name',
                  label: Text('Enter Your Name *')
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                 // hintText: 'Enter Your Email',
                    label: Text('Enter Your Email *')
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Your Password *',)

                ),
              ),
            ),


            TextButton(onPressed: (){

              // DatePicker.showDatePicker(
              //   context,
              //   minTime: DateTime(2000,01,01),
              //   maxTime: DateTime(2050,12,31),
              //   theme: DatePickerTheme(
              //     headerColor: Colors.grey,
              //     backgroundColor: Colors.green,
              //
              //   ),
              //   onChanged: (date){
              //     print(date);
              //     pickedDate = date.toString();
              //     setState(() {
              //
              //     });
              //   }
              //
              // );


              _pickDateDialog();


            }, child: Text(pickedDate)),

            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: "Male",
                        groupValue: gender,
                        onChanged: (val){
                          gender = val.toString();
                          setState(() {

                          });
                        },
                      ),
                      Text("Male"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "Female",
                        groupValue: gender,
                        onChanged: (val){
                          gender = val.toString();
                          setState(() {

                          });
                        },
                      ),
                      Text("Female"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "Others",
                        groupValue: gender,
                        onChanged: (val){
                          gender = val.toString();
                          setState(() {

                          });
                        },
                      ),
                      Text("Others"),
                    ],
                  ),
                ],
              ),


            ),


            Text("Selected Gender:"+gender),



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
    "gender":gender,
    };


      print(jsonEncode(data));
      //jsonEncode(data);


  }



  _pickDateDialog() {

    showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        initialEntryMode: DatePickerEntryMode.input,
        initialDate: DateTime.now()
    )
        .then((chooseDate) {
      if (chooseDate == null) {
        return;
      }
      setState(() {
        print(chooseDate);

        pickedDate = DateFormat('yyyy-MMM-dd hh:mm:aa').format(chooseDate).toString();
      });
    });

  }
}
