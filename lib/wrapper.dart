// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myfirstapp_vscode/authenticate/authenticate.dart';
// import 'package:myfirstapp_vscode/home/MyAnimatedBackground.dart';
// import 'package:myfirstapp_vscode/home/home.dart';
import 'package:provider/provider.dart';
import 'package:myfirstapp_vscode/models/user_model.dart' as user_model;

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<user_model.User>(context);
    print(user);
    //home or auth
    return Authenticate();

    // if (user == null) {
    //   return  const Authenticate();
    // } else {
    //   return const MyAnimatedBackground();
    // }
  }
}
