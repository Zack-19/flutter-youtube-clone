import 'package:flutter/material.dart';

class TabPages extends StatelessWidget {
  const TabPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
                child: TabBarView(children: [ 
                    Center(child: Text("home")),
                    Center(child: Text("videos")),
                    Center(child: Text("shorts")),
                    Center(child: Text("community")),
                    Center(child: Text("playlists")),
                    Center(child: Text("channels")),
                    Center(child: Text("about")),
                ]),
              );
  }
}