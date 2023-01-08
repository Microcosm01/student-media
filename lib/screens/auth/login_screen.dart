import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_media_firebase/constants/widgets/custom_snackbar.dart';
import 'package:student_media_firebase/constants/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              controller: _email,
              helperText: 'Enter your Email',
              icon: const Icon(
                Icons.email,
              ),
              isObscure: false,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 35,
            ),
            CustomTextField(
              controller: _password,
              icon: const Icon(Icons.password),
              helperText: 'Enter your password',
              isObscure: true,
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final String email = _email.text;
                    final String pass = _password.text;
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: pass);

                    Navigator.of(context).pushNamed('/home');
                  } catch (e) {
                    final snackbar = SnackBar(content: Text(e.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
                child: const Text('Login')),
               const SizedBox(height: 25,),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: const Text('Register'))
          ],
        ),
      ),
    );
  }
}
