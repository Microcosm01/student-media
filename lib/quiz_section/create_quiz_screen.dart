import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_media_firebase/constants/widgets/custom_text_field.dart';





class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  final TextEditingController _question = TextEditingController();
  final TextEditingController _option1 = TextEditingController();
  final TextEditingController _option2 = TextEditingController();
  final TextEditingController _option3 = TextEditingController();

  final TextEditingController _option4 = TextEditingController();
  final db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

 

  @override
  void dispose() {
    _question.dispose();
    _option1.dispose();
    _option2.dispose();
    _option3.dispose();
    _option4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = _auth.currentUser?.uid;
    final docRef = db.collection('Faculty').doc(userId).collection('Quiz');
    // int option = options[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Quiz for students'),
      ),
      body: Column(
        children: [
          // * QUESTION
          CustomTextField(
              controller: _question,
              icon: const Icon(Icons.question_answer),
              helperText: 'Enter question',
              isObscure: false),
          // * OPTION 1
          CustomTextField(
              controller: _option1,
              icon: const Icon(Icons.question_answer),
              helperText: 'option 1',
              isObscure: false),
          const SizedBox(
            height: 25,
          ),
          // * OPTION 2
          CustomTextField(
              controller: _option2,
              icon: const Icon(Icons.question_answer),
              helperText: 'option 2',
              isObscure: false),
          const SizedBox(
            height: 25,
          ),
          // * OPTION 3
          CustomTextField(
              controller: _option3,
              icon: const Icon(Icons.question_answer),
              helperText: 'option 3',
              isObscure: false),
          const SizedBox(
            height: 25,
          ),
          // * OPTION 4
          CustomTextField(
              controller: _option4,
              icon: const Icon(Icons.question_answer),
              helperText: 'option 4',
              isObscure: false),
          const SizedBox(
            height: 35,
          ),
          
          // Expanded(
          //   child: RadioListTile(
          //       title: const Text('option 1'),
          //       value: options[0],
          //       groupValue: options,
          //       onChanged: (value) {
          //         setState(() {
          //           option = int.parse(value.toString());
          //         });
          //       }),
          // ),
          // Expanded(
          //   child: RadioListTile(
          //       title: const Text('option 2'),
          //       value: options[1],
          //       groupValue: options,
          //       onChanged: (value) {
          //         setState(() {
          //           option = int.parse(value.toString());
          //         });
          //         print(option);
          //       }),
          // ),
          // Expanded(
          //   child: RadioListTile(
          //       title: const Text('option 3'),
          //       value: options[2],
          //       groupValue: options,
          //       onChanged: (value) {
          //         setState(() {
          //           option = int.parse(value.toString());
          //         });
          //       }),
          // ),
          // Expanded(
          //   child: RadioListTile(
          //       title: const Text('option 4'),
          //       value: options[3],
          //       groupValue: options,
          //       onChanged: (value) {
          //         setState(() {
          //           option = int.parse(value.toString());
          //         });
          //       }),
          // ),

          // TODO: Implement Last day via Date picker package
          ElevatedButton(
              onPressed: () async {
                final data = {
                  "question": _question.text,
                  "option-1": _option1.text,
                  "option-2": _option2.text,
                  "option-3": _option3.text,
                  "option-4": _option4.text,
                  "correct-answer": _option2.text,
                };
                await docRef.doc().set(data);
                Navigator.of(context).pushNamed('/facultyHome');
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
