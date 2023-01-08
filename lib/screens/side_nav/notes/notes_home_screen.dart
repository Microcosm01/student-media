import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class NotesHomeScreen extends StatefulWidget {
  const NotesHomeScreen({super.key});

  @override
  State<NotesHomeScreen> createState() => _NotesHomeScreenState();
}

class _NotesHomeScreenState extends State<NotesHomeScreen> {
  final storageRef = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    final gsRef = storageRef.refFromURL(
        'https://firebasestorage.googleapis.com/v0/b/student-media-taufeeq.appspot.com/o/Student%20Media%20proposal.pdf?alt=media&token=bdee0d1e-b949-4c16-ad4d-2994f683c083');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes Home Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                await gsRef.getData();
              },
              child: const Text('Download'))
        ],
      ),
    );
  }
}
