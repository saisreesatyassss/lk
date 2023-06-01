import 'package:firebase_auth/firebase_auth.dart';

import 'package:myfirstapp_vscode/models/user_model.dart' as myapp;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // user boj based in firebase
  myapp.User? _userFromFirebaseUser(User? user) {
    return user != null ? myapp.User(uid: user.uid) : null;
  }

//auth chnage stream
  Stream<myapp.User?>? get user {
    return _auth
        .authStateChanges()
        // .map((User user)=> _userFromFirebaseUser(user));
        .map<myapp.User?>(_userFromFirebaseUser);
  }

// sifn in anomoys
  Future<myapp.User?> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email

   Future<User?>  signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // reister in email
  Future<myapp.User?> registerWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = result.user;
      return _userFromFirebaseUser(user);
  } catch (error) {
    print(error.toString());
    return null;
  }
}


  //signout

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}
