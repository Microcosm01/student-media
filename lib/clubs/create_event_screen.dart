import 'package:flutter/material.dart';
import 'package:student_media_firebase/constants/widgets/custom_text_field.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController _title = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          CustomTextField(
              controller: _title,
              icon: const Icon(Icons.title),
              helperText: 'Enter the name of the event',
              isObscure: false)
        ],
      ),
    );
  }
}
