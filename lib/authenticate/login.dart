import 'package:flutter/material.dart';
// import 'package:myfirstapp_vscode/login_1.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'login_1.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   title: Text(' Card'),
      //   centerTitle: true,
      //   backgroundColor: Colors.grey[850],
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background_img.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: const Alignment(0, 0.5),
              child: Hero(tag: "1", child: Image.asset('assets/Rock.png')),
            ),
          ),
          Hero(
            tag: "infinia",
            child: Container(
              child: Align(
                alignment: const Alignment(0, 0.85),
                child: GradientText(
                  " Infinia ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins-Thin",
                      fontSize: 100.0,
                      letterSpacing: 5,
                      color: Colors.grey[700],
                      shadows: [
                        Shadow(
                            color: Colors.white.withOpacity(0.3),
                            offset: const Offset(5, 5),
                            blurRadius: 15),
                      ]),
                  colors: const [
                    Color.fromARGB(255, 206, 206, 206),
                    Color.fromARGB(255, 109, 109, 109),
                    Color.fromARGB(255, 48, 48, 48),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 4),
                      pageBuilder: (_, __, ___) => const login_1()),
                );
              },
              child: Ink.image(
                image: const AssetImage("assets/Rock.png"),
                height: 200,
                width: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
