import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:myfirstapp_vscode/authenticate/register.dart';
import 'package:myfirstapp_vscode/services/Google_Sign_In.dart';
import 'package:provider/provider.dart';
// import 'package:myfirstapp_vscode/login_2.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../home/MyAnimatedBackground.dart';
import 'login_2.dart';

class login_1 extends StatefulWidget {
  const login_1({Key? key}) : super(key: key);

  @override
  State<login_1> createState() => _login_1State();
}

class _login_1State extends State<login_1> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background_img.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Align(
              alignment: const Alignment(-0.5, -0.92),
              child: Hero(
                  tag: "1",
                  child: Image.asset(
                    'assets/Rock.png',
                    height: 150,
                  )),
            ),

            RotatedBox(
              quarterTurns: 1,
              child: Hero(
                tag: "infinia",
                child: Container(
                  child: Align(
                    alignment: const Alignment(-0.9, -1),
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
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(15, 15),
                                blurRadius: 15),
                          ]),
                      colors: const [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 109, 109, 109),
                        Color.fromARGB(255, 48, 48, 48),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Container(
              child: const Align(
                alignment: Alignment(-1, -0.27),
                child: Text(
                  " Welcome  ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 50.0,
                    letterSpacing: 5,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),

            Container(
              child: const Align(
                alignment: Alignment(-0.8, 0),
                child: Text(
                  " Get started by\n creating your\n account  ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 21.0,
                    letterSpacing: 5,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),

            const _sing_up(),
            // _sing_up(),
            const _Google(),
            _Apple(),
            const _Login(),
            Container(
              child: Align(
                alignment: const Alignment(-0.6, 0.56),
                child: Image.asset("assets/google_icon.png", height: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Google extends StatelessWidget {
  const _Google();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.63),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            await provider.googleLogin();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyAnimatedBackground()),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 5.0,
            backgroundColor: const Color.fromARGB(255, 20, 19, 19),
            padding: const EdgeInsets.all(17.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              'Continue with Google',
              style: TextStyle(
                color: Color.fromARGB(255, 225, 226, 226),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 1),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/register");

            // Navigator.push(
            //   context,
            //   PageRouteBuilder(
            //       transitionDuration: Duration(seconds: 4),
            //       pageBuilder: (_, __, ___) => register()),
            // );
          },
          style: ElevatedButton.styleFrom(
            elevation: 5.0,
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            padding: const EdgeInsets.all(17.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text(
            'Log in',
            style: TextStyle(
              color: Color.fromARGB(255, 225, 226, 226),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }
}

class _sing_up extends StatelessWidget {
  const _sing_up();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.435),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pushReplacementNamed(context, "/login_2");
            Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 4),
                  pageBuilder: (_, __, ___) => const login_2()),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 5.0,
            backgroundColor: const Color.fromARGB(255, 20, 19, 19),
            padding: const EdgeInsets.all(17.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text(
            'Sign up',
            style: TextStyle(
              color: Color.fromARGB(255, 225, 226, 226),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }
}

// Widget _Google() {
//   return Align(
//     alignment: Alignment(0, 0.63),
//     child: Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: double.infinity,
//       child: ElevatedButton(
//        onPressed: () {
//   // final googleSignInProvider =
//   //     Provider.of<GoogleSignInProvider>(context, listen: false);
//   // googleSignInProvider.googleLogin();
// },

//         style: ElevatedButton.styleFrom(
//           elevation: 5.0,
//           padding: EdgeInsets.all(17.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           primary: Color.fromARGB(255, 20, 19, 19),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
//           child: Text(
//             'Continue with Google',
//             style: TextStyle(
//               color: Color.fromARGB(255, 225, 226, 226),
//               letterSpacing: 1.5,
//               fontSize: 18.0,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'OpenSans',
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

Widget _Apple() {
  return Align(
    alignment: const Alignment(0, 0.82),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.apple,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 25.0,
        ),
        onPressed: () {},
        label: const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            'Continue with Apple',
            style: TextStyle(
              color: Color.fromARGB(255, 225, 226, 226),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          backgroundColor: const Color.fromARGB(255, 20, 19, 19),
          padding: const EdgeInsets.all(17.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        // child: Text(
        //   'Continue with Google',
        //   style: TextStyle(
        //     color: Color.fromARGB(255, 225, 226, 226),
        //     letterSpacing: 1.5,
        //     fontSize: 18.0,
        //     fontWeight: FontWeight.w500,
        //     fontFamily: 'OpenSans',
        //   ),
        // ),
      ),
    ),
  );
}
