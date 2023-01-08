import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ListView(
        children: [
          const SizedBox(height: 75),
          ListTile(
            enableFeedback: true,
            minLeadingWidth: 20,
            leading: const Icon(
              Icons.timer,
              color: Colors.white,
            ),
            title: const Text(
              'Pomodoro View',
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/pomodoro');
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            enableFeedback: true,
            minLeadingWidth: 20,
            leading: const Icon(
              Icons.menu_book,
              color: Colors.white,
            ),
            title: const Text(
              'Projects View',
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            enableFeedback: true,
            minLeadingWidth: 20,
            leading: const Icon(
              Icons.timer,
              color: Colors.white,
            ),
            title: const Text(
              'Pomodoro View',
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            minLeadingWidth: 20,
            enableFeedback: true,
            leading: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: const Text(
              'My Profile',
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 55,
          ),
          Container(
            margin: const EdgeInsets.only(left: 35, right: 30),
            height: 45,
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamed('/login');
              },
              child:  const Text(
                'Sign out',
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
