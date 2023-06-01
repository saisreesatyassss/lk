import 'package:flutter/material.dart';
import 'package:myfirstapp_vscode/authenticate/SignIn.dart';
import 'package:myfirstapp_vscode/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  @override
  Widget build(BuildContext context) {
    return showSignIn ? const SignIn() : const Register();
  }
}
