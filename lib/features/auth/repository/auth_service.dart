import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;
  
  AuthService({
    required this.auth,
    required this.googleSignIn,
  });

  signInWithGoogle() async{
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize();
    final user = await googleSignIn.authenticate();
    final googleAuth =user.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    await auth.signInWithCredential(credential);



  }


}