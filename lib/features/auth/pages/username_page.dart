import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/repository/user_data_service.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String profilePic;
  final String email;

  const UsernamePage({
    required this.displayName,
    required this.profilePic,
    required this.email,

  });
  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}



class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController usernameController = TextEditingController();
  bool isValid = true;
  void validateUsername()async{
    final usersMap = await FirebaseFirestore.instance.collection("users").get();
    final users = usersMap.docs.map((user)=>user).toList();
    String? targetedUsername;
    for (var user in users){
      if(usernameController.text==user.data()["username"]){
        targetedUsername = user.data()["username"];
        isValid = false;
        setState((){});
      }
      if(usernameController.text!=targetedUsername){
        isValid = true;
        setState(() {});
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 26,horizontal: 14),
              child: Text("enter user name",style: TextStyle(color:Colors.blueGrey ),),
              ),
            Padding(
              padding: const EdgeInsets.only(left :  15 , right: 15),
              child: TextFormField(
                onChanged: (username){
                  validateUsername();
                },
                autovalidateMode: AutovalidateMode.always,
                validator: (username){
                  isValid ? null : "username already taken ";
                },
                key: formKey,
                controller: usernameController,
                decoration: InputDecoration(
                  suffixIcon: isValid ?  Icon(Icons.verified_user_rounded): Icon(Icons.cancel),
                  suffixIconColor: isValid ? Colors.green : Colors.red,
                  hintText: "insert user name",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    )
                  )
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30,left:15,right:30),
              child: FlatButton(
                text:"continue", 
                onPressed: () async{
                  isValid ? 
                  await ref.read(userDataServiceProvider).addUserDataToFirestore(
                    displayName: widget.displayName, 
                    username: usernameController.text, 
                    email:widget.email, 
                    profilePic: widget.profilePic, 
                    description: "") : null;
                }, 
                colour: isValid ? Colors.green : Colors.green.shade100),
            ),
          ],
        ) ),
    );
  }
}