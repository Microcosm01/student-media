import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_media_firebase/constants/widgets/custom_text_field.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new Task'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // * TITLE
            CustomTextField(
                controller: _title,
                icon: const Icon(Icons.abc),
                helperText: 'Enter Title Here',
                isObscure: false),
            const SizedBox(
              height: 25,
            ),

            // * DESCRIPTION
            CustomTextField(
                controller: _description,
                icon: const Icon(Icons.abc),
                helperText: 'Enter desciption Here',
                isObscure: false),
            const SizedBox(
              height: 25,
            ),
            // * ADD TASK
            ElevatedButton(
                onPressed: () async {
                  final title = _title.text;
                  final description = _description.text;
                  final data = {
                    "title": title,
                    "desciption": description,
                  };
                  final userId = _auth.currentUser?.uid;
                  final docRef =
                      db.collection('Student').doc(userId).collection('todo');
                  await docRef.add(data);
                },
                child: const Text('ADD TASK'))
          ],
        ),
      ),
    );
  }
}
