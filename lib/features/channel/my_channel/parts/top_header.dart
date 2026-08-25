import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}