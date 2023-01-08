import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController controller,
    required this.icon,
    required this.helperText,
    required this.isObscure,
    this.keyboardType,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final Icon icon;
  final String helperText;
  final bool isObscure;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 355,
      child: TextField(
        controller: _controller,
        obscureText: isObscure,
        keyboardType: keyboardType,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: helperText,
          icon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
