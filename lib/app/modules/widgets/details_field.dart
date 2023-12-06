import 'package:flutter/material.dart';

class DetailsFeild extends StatelessWidget {
  const DetailsFeild({
    super.key,
    required this.hintText,
    required this.controller,
  });
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color.fromARGB(255, 143, 138, 138),
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          hintText: hintText,
          fillColor: const Color.fromARGB(255, 187, 184, 201),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none)),
    );
  }
}
