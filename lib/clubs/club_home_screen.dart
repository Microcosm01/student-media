import 'package:flutter/material.dart';

class ClubHomeScreen extends StatefulWidget {
  const ClubHomeScreen({super.key});

  @override
  State<ClubHomeScreen> createState() => _ClubHomeScreenState();
}

class _ClubHomeScreenState extends State<ClubHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Club Home Screen'),
      ),
    );
  }
}
