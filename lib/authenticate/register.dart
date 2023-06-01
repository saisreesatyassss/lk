// ignore_for_file: use_build_context_synchronously

import 'package:myfirstapp_vscode/services/auth.dart';
// import 'package:myfirstapp_vscode/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp_vscode/home/MyAnimatedBackground.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  // const Register({Key? key, required void Function() toggleView})
  //     : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final formKey = GlobalKey<FormState>(); //key for form

  String name = "";

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background_img.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: const Alignment(-1, 1),
            child: Image.asset(
              'assets/white_curve_1.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20, 400, 100, 100),
            child: Text(
              "Register",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  letterSpacing: 1,
                  color: Colors.black),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 430),
          alignment: const Alignment(-0.9, 0.1),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter valid email id as abc@gmail.com",
                      labelText: "Your Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter email';
                      }
                      if (value.isEmpty ||
                          !RegExp(r'^([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$')
                              .hasMatch(value)) {
                        return 'Please enter correct email';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 8,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: "Enter secure password",
                      labelText: "Password",
                    ),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: const Alignment(1, 5),
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1)),
                            child: const Text(
                              'Skip >',
                              style: TextStyle(
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //         content: Text('Processing Data')),
                              //   );
                              // }w

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyAnimatedBackground()),
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(1, 1),
                        child: SizedBox(
                          // height: 50,
                          // width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.black,
                              shadowColor: Colors.black,
                              elevation: 20,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 30),
                              child: Text(
                                'Login ->',
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                  });
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyAnimatedBackground()),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Align(
                            alignment: Alignment(0, 0),
                            child: Text(
                              " Already have an account ?  ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                letterSpacing: 0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   child: Align(
                        //     alignment: Alignment(0, 0),
                        //     child: Text(
                        //       " Sign Up Now ",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.w900,
                        //         fontSize: 15.0,
                        //         letterSpacing: 0,
                        //         color: Color.fromARGB(255, 0, 0, 0),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/login_2");
                          },
                          child: const Text(
                            " Sign Up Now ",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12.0,
                              letterSpacing: 0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-0.5, -0.80),
          child: Hero(tag: "1", child: Image.asset('assets/Rock.png')),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Container(
            child: Align(
              alignment: const Alignment(-0.9, -1),
              child: Hero(
                tag: "infinia",
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
          child: Align(
            alignment: const Alignment(-0.9, -0.42),
            child: Image.asset(
              'assets/profile_pic_1.png',
              height: 52,
            ),
          ),
        ),
        Container(
          child: const Align(
            alignment: Alignment(-1, -0.27),
            child: Text(
              " John Doe  ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 5,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
        Container(
          child: const Align(
            alignment: Alignment(-0.9, -0.15),
            child: Text(
              " The journey of a thousand\n miles begins with a single\n step.  ",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14.0,
                letterSpacing: 1.5,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
