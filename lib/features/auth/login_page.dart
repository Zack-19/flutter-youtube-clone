import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25,bottom: 20),
            child: Image.asset("assets/images/youtube-signin.jpg",height: 150,),
          ),
          Text('welcome to youtube',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),)

        ],
      ),)),
    );
  }
}
