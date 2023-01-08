// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(content),
      elevation: 10,
    duration: const Duration(milliseconds: 500),
    );
  }
}
