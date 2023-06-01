import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
 
import 'package:myfirstapp_vscode/home/search.dart';
// import 'package:myfirstapp_vscode/Nav_Bar.dart';

// import '../home.dart';
import 'Nav_Bar.dart';
import 'analytics.dart';
import 'bio.dart';
import 'chat.dart';
import 'home.dart';

// main class calling to
// the MyAnimatedBackground.
void main() {
  runApp(const MyAnimatedBackground());
}

// MyAnimatedBackground class is stateful class.
class MyAnimatedBackground extends StatefulWidget {
  const MyAnimatedBackground({Key? key}) : super(key: key);

  @override
  State<MyAnimatedBackground> createState() => _MyAnimatedBackgroundState();
}

class _MyAnimatedBackgroundState extends State<MyAnimatedBackground>
    with SingleTickerProviderStateMixin {
// definition of ParticlesOptions.
  ParticleOptions particles = const ParticleOptions(
    baseColor: Color.fromARGB(255, 177, 177, 177),
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.5,
    maxOpacity: 0.6,
    particleCount: 10,
    spawnMaxRadius: 100.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 50,
    spawnMinRadius: 20.0,
    // image: Image(image: AssetImage("assets/Ellipse.png"))
  );
  int _selectedIndex = 0;

  void _navigatedBottmBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const home(),
    const analytics(),
    const chat(),
    const search(),
    const bio(),
  ];

  @override
  Widget build(BuildContext context) {
    // return MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Nav_Bar(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: AnimatedBackground(
          // vsync uses singleTicketProvider state mixin.
          vsync: this,
          behaviour: RandomParticleBehaviour(options: particles),
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/wave.png',
                  fit: BoxFit.fill,
                ),
              ),
              _pages[_selectedIndex],
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              backgroundColor: const Color.fromARGB(255, 156, 155, 155),
              selectedItemColor: const Color.fromARGB(255, 233, 231, 231),
              type: BottomNavigationBarType.fixed,
              onTap: _navigatedBottmBar,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.analytics), label: "analytics"),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "search"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "bio"),
              ]),
        ),
      ),
      //home.dart
    );
  }
}
