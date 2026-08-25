
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/setting_field_item.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool isSwitched =false;
  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider).when(
      data: (currentUser)=>Scaffold(
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/flutter background.png",
                      fit: BoxFit.cover,
                    )),

                    Positioned(
                      left: 150,
                      top : 60,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        backgroundImage: currentUser.profilePic.isNotEmpty
                            ? CachedNetworkImageProvider(currentUser.profilePic)
                            : null,
                              onBackgroundImageError: (exception, stackTrace) {
                               debugPrint('Avatar image error: $exception');
                              },
                      ),
                    ),
                    Positioned(
                      right:10,
                      top : 10,
                      child:Image.asset(
                        "assets/icons/camera.png",
                        height: 30,
                        color: Colors.white,
                      )
                    )
                ],
              ),
                SizedBox(height: 15,),

              SettingsItem(
                identifier: "name", 
                onPressed: (){}, 
                value: currentUser.displayName
                ),
                SizedBox(height: 15,),
              SettingsItem(
                identifier: "handle", 
                onPressed: (){}, 
                value: currentUser.username
                ),
                SizedBox(height: 15,),
            
              SettingsItem(
                identifier: "description", 
                onPressed: (){}, 
                value: currentUser.description
                ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("keep all my subscribers private"),
                    Switch(value: isSwitched, 
                    onChanged: (value){
                        isSwitched = value;
                        setState(() {});
                    })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Text("changes on your name and profile picture are visible only to youtube and not other google services",
                style: TextStyle(color: Colors.blueGrey),
                textAlign: TextAlign.center,),
              )
            ]
            
            ,),)
         ),
    ), 
      error: (error,stackTrace)=>ErrorPage(), 
      loading: ()=>Loader());
  }
}