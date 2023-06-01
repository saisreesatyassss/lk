import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:myfirstapp_vscode/models/user_model.dart';

class GoogleSignInProvider extends ChangeNotifier {
  // Declare a private variable to store the user accoun
  GoogleSignInAccount? _user;

  // Define a getter to access the user account
  GoogleSignInAccount get user => _user!;

  // Create an instance of GoogleSignIn
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _isSigningIn = false;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  // Implement the googleLogin() method to handle Google sign-in
  Future googleLogin() async {
    isSigningIn = true;

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      isSigningIn = false;
      return;
    } else {
      // _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      isSigningIn = false;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
