import 'package:flutter/material.dart';
import 'package:student_media_firebase/screens/social/social_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:student_media_firebase/screens/college_related/college_home.dart';
import 'package:student_media_firebase/screens/event_register/event_register_home.dart';
import 'package:student_media_firebase/screens/todo/todo_home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<GButton> tabs = [
    const GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    const GButton(
      icon: Icons.format_list_bulleted,
      text: 'Todo',
    ),
    const GButton(
      icon: Icons.connect_without_contact,
      text: 'Social',
    ),
    const GButton(
      icon: Icons.event,
      text: 'Events',
    ),
    const GButton(
      icon: Icons.school,
      text: 'College',
    ),
  ];

  int currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List pages = [
    const WelcomeScreen(),
    const TodoHomePage(),
    const SocialHomePage(),
    const EventRegisterHomeScreen(),
    const CollegeHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GNav(
          duration: const Duration(milliseconds: 650),
          rippleColor: Colors.purpleAccent,
          tabs: tabs,
          onTabChange: _onTap,
        ),
        body: pages[currentIndex],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Center(
            child: Text('Home Page'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FloatingActionButton(
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/chat');
              },
              backgroundColor: Colors.blue,
              elevation: 10,
            ),
          )
        ],
      ),
    );
  }
}
