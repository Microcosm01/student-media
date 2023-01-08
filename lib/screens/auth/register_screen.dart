import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_media_firebase/constants/widgets/custom_text_field.dart';

const List<String> branch = [
  "CSE",
  "MECHANICAL",
  "PRODUCTION",
  "IT",
  "EEE",
  "ECE",
  "AIDS",
  "AIML",
  "CIVIL",
  "EIE"
];

const List<String> sem = ['1', '2', '3', '4', '5', '6', '7', '8'];

enum userType { student, faculty, Club }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  userType? type = userType.student;

  String dropdown_value = branch.first;
  String drop_down_value = sem.first;
  final db = FirebaseFirestore.instance;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    final userId = auth.currentUser?.uid;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // * PROFILE PIC
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  child: Icon(Icons.person),
                  radius: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // * NAME
              CustomTextField(
                  controller: _name,
                  icon: const Icon(Icons.abc),
                  helperText: 'Enter your name',
                  isObscure: false),
              // * EMAIL
              CustomTextField(
                  controller: _email,
                  icon: const Icon(Icons.email),
                  helperText: 'Enter your email',
                  isObscure: false),
              //* PASSWORD
              CustomTextField(
                  controller: _password,
                  icon: const Icon(Icons.key),
                  helperText: 'Enter your password',
                  isObscure: true),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // * BRANCH
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                        value: dropdown_value,
                        items: branch.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                        onChanged: (String? e) {
                          setState(() {
                            dropdown_value = e!;
                          });
                        }),
                  ),
                  // * SEM
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        value: drop_down_value,
                        items: sem.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (String? e) {
                          setState(() {
                            drop_down_value = e!;
                          });
                        }),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                        title: const Text('Student'),
                        value: userType.student,
                        groupValue: type,
                        onChanged: (userType? value) {
                          setState(() {
                            type = value;
                          });
                          print(type);
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title: const Text('Faculty'),
                        value: userType.faculty,
                        groupValue: type,
                        onChanged: (userType? value) {
                          setState(() {
                            type = value;
                          });
                          print(type);
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title: const Text('Club'),
                        value: userType.Club,
                        groupValue: type,
                        onChanged: (userType? value) {
                          setState(() {
                            type = value;
                          });
                          print(type);
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final String name = _name.text;
                      final String email = _email.text;
                      final String pass = _password.text;
                      await auth.createUserWithEmailAndPassword(
                          email: email, password: pass);

                      if (type == userType.faculty) {
                        final data = {"name": name};
                        final docRef = db
                            .collection('Faculty')
                            .doc(userId)
                            .collection('userDetails');
                        await docRef.doc().set(data);
                        Navigator.of(context).pushNamed('/facultyHome');
                      } else if (type == userType.Club) {
                        final docRef = db
                            .collection('Club')
                            .doc(userId)
                            .collection('userDetails');
                        final data = {"name": name};
                        await docRef.doc().set(data);
                        Navigator.of(context).pushNamed('/clubHome');
                      } else {
                        final data = {
                          "name": name,
                          "branch": dropdown_value,
                          "sem": drop_down_value,
                        };
                        final docRef = db
                            .collection('Student')
                            .doc(userId)
                            .collection('userDetails');
                        await docRef.doc().set(data);
                        Navigator.of(context).pushNamed('/home');
                      }
                    } catch (e) {
                      final snackbar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  },
                  child: const Text('Register here')),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/login'),
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
