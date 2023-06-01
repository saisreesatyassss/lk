// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:myfirstapp_vscode/authenticate/authenticate.dart';
// import 'package:myfirstapp_vscode/authenticate/SignIn.dart';
// import 'package:myfirstapp_vscode/authenticate/register.dart';
// import 'package:myfirstapp_vscode/home/MyAnimatedBackground.dart';
// import 'package:myfirstapp_vscode/models/user_model.dart' as user_model;
// import 'package:myfirstapp_vscode/services/Google_Sign_In.dart';
// import 'package:myfirstapp_vscode/services/auth.dart';
// import 'package:myfirstapp_vscode/wrapper.dart';
// import 'package:provider/provider.dart';

// import 'authenticate/login.dart';
// import 'authenticate/login_1.dart';
// import 'authenticate/login_2.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MaterialApp(
//       // home: FirstApp(),
//       initialRoute: "/register",
//       routes: {
//         "/": (context) => login(),
//         "/login_1": (context) => login_1(),
//         "/login_2": (context) => login_2(),
//         "/register": (context) => Register(),
//         "/home_1": (context) => MyAnimatedBackground(),
//         "/authenticate": (context) => Authenticate(),
//         "/SignIn": (context) => SignIn(),
//         "/Wrapper": (context) => Wrapper(),
//       },
//     ),
//   );
// }
// // FirstApp

// class FirstApp extends StatefulWidget {
//   @override
//   _FirstAppState createState() => _FirstAppState();
// }

// class _FirstAppState extends State<FirstApp> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<user_model.User?>.value(
//       value: AuthService().user,
//       initialData: null,
//       child: ChangeNotifierProvider(
//         create: (context) => GoogleSignInProvider(),
//         child: MaterialApp(
//           home: Wrapper(),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp_vscode/authenticate/authenticate.dart';
import 'package:myfirstapp_vscode/authenticate/SignIn.dart';
import 'package:myfirstapp_vscode/authenticate/register.dart';
import 'package:myfirstapp_vscode/home/MyAnimatedBackground.dart';
import 'package:myfirstapp_vscode/models/user_model.dart' as user_model;
import 'package:myfirstapp_vscode/services/Google_Sign_In.dart';
import 'package:myfirstapp_vscode/services/auth.dart';
import 'package:myfirstapp_vscode/wrapper.dart';
import 'package:provider/provider.dart';

import 'authenticate/login.dart';
import 'authenticate/login_1.dart';
import 'authenticate/login_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<user_model.User?>.value(
          value: AuthService().user,
          initialData: null,
        ),
        ChangeNotifierProvider<GoogleSignInProvider>(
          create: (context) => GoogleSignInProvider(),
        ),
      ],
      child: MaterialApp(
        // initialRoute: '/register',
        routes: {
          '/': (context) => const login(),
          '/login_1': (context) => const login_1(),
          '/login_2': (context) => const login_2(),
          '/register': (context) => const Register(),
          '/home_1': (context) => const MyAnimatedBackground(),
          '/authenticate': (context) => const Authenticate(),
          '/SignIn': (context) => const SignIn(),
          '/Wrapper': (context) => const Wrapper(),
        },
      ),
    );
  }
}
