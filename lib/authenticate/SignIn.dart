import 'package:flutter/material.dart';
// import 'package:myfirstapp_vscode/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  // SignIn({Key? key, required void Function() toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Sign In To INFINIA"),
      ),
      body: Center(
        child: Container(
            // child: ElevatedButton(
            //   onPressed: () async {
            //     dynamic result = await _auth.signInAnonymously();
            //     if (result == null) {
            //       print("error in signing");
            //     } else {
            //       print("signed in ");
            //       print(result.uid);
            //     }
            //   },
            //   child: Text("Sign in anonymously"),
            // ),

            // child: ,
            ),
      ),
    );
  }
}
