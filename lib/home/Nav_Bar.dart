import 'package:flutter/material.dart';
// import 'package:myfirstapp_vscode/authenticate/login_1.dart';
import 'package:myfirstapp_vscode/services/auth.dart';
import 'package:provider/provider.dart';

import '../authenticate/login_1.dart';
import '../services/Google_Sign_In.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class Nav_Bar extends StatelessWidget {
  Nav_Bar({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // accountName: const Text('John Doe'),
            accountName: const Text('John Doe'),
            accountEmail: const Text('JohanDoe@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/profile_pic_1.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 58, 58),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/wave.png'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Friends'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {},
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () async {
              // await _auth.signOut();

              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const login_1()),
              );
            },
          ),
        ],
      ),
    );
  }
}
