import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

final authServiceProvider =  Provider(
  (ref)=>AuthService(auth: FirebaseAuth.instance,googleSignIn: GoogleSignIn.instance ,),
  );

class AuthService {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;
  
  AuthService({
    required this.auth,
    required this.googleSignIn,
  });

  /*signInWithGoogle() async{
    //final GoogleSignIn googleSignIn = GoogleSignIn(clientId : '99990800267-j3d110mi656hgq0p9qq9p34i0ccrbfh9.apps.googleusercontent.com');
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize();
    final user = await googleSignIn.authenticate();
    final googleAuth =user.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    await auth.signInWithCredential(credential);



  }*/
  Future<UserCredential?> signInWithGoogle() async {
    if (kIsWeb) {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();

      return await auth.signInWithPopup(googleProvider);
    }

    // Android / iOS
    await googleSignIn.initialize();

    final user = await googleSignIn.authenticate();

    final googleAuth = user.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return await auth.signInWithCredential(credential);
  }


}