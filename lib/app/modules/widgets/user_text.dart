import 'package:flutter/material.dart';

class UserText extends StatelessWidget {
  const UserText({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF2B3594),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
