import 'package:flutter/material.dart';

Widget RegisterInput({
  BuildContext? context,
  String? labelText,
  bool obscureText = false,
  Key? key,
  TextEditingController? controller, // Add the controller parameter
  GestureTapCallback? onTap,
  IconData? icon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        controller: controller, // Use the controller
        onTap: onTap,
        key: key,
        obscureText: obscureText,
        readOnly: onTap != null,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: onTap != null
              ? Icon(
                  icon,
                  color: Colors.grey[600],
                )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 184, 11, 11),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 184, 182, 182),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 184, 11, 11),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      SizedBox(
        height: 14,
      )
    ],
  );
}
