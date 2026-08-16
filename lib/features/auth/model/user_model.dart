import 'dart:convert';

class UserModel {
  final String displayName;
  final String username;
  final String email;
  final String profilePic;
  final String subscriptions;
  final String videos;
  final String userId;
  final String description;
  final String type;

  UserModel({
    required this.displayName, 
    required this.username, 
    required this.email, 
    required this.profilePic, 
    required this.subscriptions, 
    required this.videos, 
    required this.userId, 
    required this.description, 
    required this.type});

    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'username': username,
      'email': email,
      'profilePic': profilePic,
      'subscriptions': subscriptions,
      'videos': videos,
      'userId': userId,
      'description': description,
      'type': type,
    };
  }


   factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
      displayName: map['displayName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      profilePic: map['profilePic'] as String,
      subscriptions: map['subscriptions'] as String,
      videos: map['videos'] as String,
      userId: map['userId'] as String,
      description: map['description'] as String,
      type: map['type'] as String,

    );
  } 

  String toJson()=>json.encode(toMap());
  factory UserModel.fromJson(String source)=>UserModel.fromMap(json.decoder(source)as)
}

 