import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(

            children: [
              Center(
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  "place holder text",
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: RichText(text: TextSpan(
                  style: TextStyle(color: Colors.blueGrey),
                  children:[
                    TextSpan(text:"username  " ),
                    TextSpan(text:"no subscription  " ),
                    TextSpan(text:"no videos  " ),
                
                ] )
                ),
              ),
              Text("more about this channel"),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: softBlueGreyBackGround,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: TextButton(
                          onPressed: (){}, 
                          child: Text("manage videos",style: TextStyle(color: Colors.black),)),
                      ),
                    ),
                    Expanded(child: ImageButton(onPressed: (){}, image: "pen.png", haveColor: true)),
                    Expanded(child: ImageButton(onPressed: (){}, image: "time-watched.png", haveColor: true))
                
                  ],
                ),
              )
            ],
          ),
        ) 
      ),
    );
  }
}