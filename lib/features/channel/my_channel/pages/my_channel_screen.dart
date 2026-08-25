import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/buttons.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tab_bar.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tab_bar_view.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/top_header.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, 
      child: Scaffold(
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(

            children: [
              TopHeader(),
              Text("more about this channel"),
              Buttons(),
              PageTabBar(),
              TabPages(),
            ],
          ),
        ) 
      ),
    )
    );
  }
}