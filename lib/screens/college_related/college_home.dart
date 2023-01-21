import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// * THIS IS FOR DISPLAYING THE QUIZ
class CollegeHomeScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  CollegeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser?.uid;
    final docRef = db.collection('Faculty').doc(userId).collection('Quiz');
    return Scaffold(body: StreamBuilder(builder: ((context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              child: ListTile(
                title: Text(''),
                subtitle: Text(''),
              ),
            ),
          );
        }));
      }
      return const CircularProgressIndicator();
    })));
  }
}

class DisplayQuiz extends StatefulWidget {
  const DisplayQuiz({super.key});

  @override
  State<DisplayQuiz> createState() => _DisplayQuizState();
}

class _DisplayQuizState extends State<DisplayQuiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Question
        //* Options
        ElevatedButton(
            onPressed: () {
              for (int i = 0; i < 3; i++) {
                Navigator.of(context).pushNamed('/displayQuiz');
              }
            },
            child: const Text('Next'))
      ],
    );
  }
}
