import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:student_media_firebase/screens/home/main_screen.dart';
import 'package:student_media_firebase/screens/home/side_menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ZoomDrawerController();
    return ZoomDrawer(
      controller: controller,
      menuScreen: const SideMenuScreen(),
      mainScreen: const MainScreen(),
      menuBackgroundColor: Colors.blueAccent,
      borderRadius: 40,
      showShadow: false,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
