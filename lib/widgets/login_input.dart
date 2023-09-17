import 'package:flutter/material.dart';

Widget LoginInput({
  String? labelText,
  bool obscureText = false,
  TextEditingController? controller,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 184, 11, 11),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 184, 11, 11),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 184, 182, 182),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      ),
    ),
  );
}
