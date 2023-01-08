import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_media_firebase/clubs/club_home_screen.dart';
import 'package:student_media_firebase/firebase_options.dart';
import 'package:student_media_firebase/quiz_section/create_quiz_screen.dart';

import 'package:student_media_firebase/screens/auth/login_screen.dart';
import 'package:student_media_firebase/screens/auth/register_screen.dart';
import 'package:student_media_firebase/screens/chat/chat_home_screen.dart';
import 'package:student_media_firebase/screens/faculty/faculty_home_screen.dart';
import 'package:student_media_firebase/screens/home/home_screen.dart';
import 'package:student_media_firebase/screens/side_nav/notes/notes_home_screen.dart';
import 'package:student_media_firebase/screens/side_nav/pomodo_screen.dart';

import 'package:student_media_firebase/screens/todo/create_task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/chat': (context) => const ChatHomeScreen(),
        '/pomodoro': (context) => const PomodoroScreen(),
        '/tasks': (context) => const CreateTaskScreen(),
        '/facultyHome': (context) => const FacultyHomeScreen(),
        '/clubHome': (context) => const ClubHomeScreen(),
        '/notesHome': (context) => const NotesHomeScreen(),
      },
    );
  }
}
