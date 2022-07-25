import 'package:api_impl/registration.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children: [

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

            ElevatedButton(onPressed: (){

            }, child: Text("Sign In")),
            TextButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>RegistrationPage()));
            }, child: Text("Create an account"))
          ],
        ),
      ),
    );
  }
}
