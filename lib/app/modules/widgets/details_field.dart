import 'package:flutter/material.dart';

class DetailsFeild extends StatelessWidget {
  const DetailsFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color.fromARGB(255, 143, 138, 138),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          fillColor: const Color.fromARGB(255, 187, 184, 201),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none)),
    );
  }
}
