import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
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
              ),
      ],
    );
  }
}