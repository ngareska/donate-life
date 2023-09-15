import 'dart:math';
import 'package:donate_life/forgotten_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:donate_life/home_screen.dart';
import 'package:donate_life/register_screen.dart';

class NextScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Container(
                      width: 200,
                      height: 100,
                      child: Image.asset('assets/images/logo.png')),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Логирај се',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          height: sqrt1_2),
                    ),
                  ),
                ],
              ),
            ),
            makeInput(
              labelText: 'Корисничко име (Е-mail)',
              controller: emailController,
              obscureText: false,
            ),
            makeInput(
              labelText: 'Лозинка',
              controller: passwordController,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 225),
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => ChangePasswordScreen()),
                  // );
                },
                child: Text(
                  'Заборавена лозинка?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 360,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 184, 11, 11),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () async {
                  final url =
                      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBcobkvJIoDRTk7xCm759EgSIYQpiqHFIA'; // Replace with your API key
                  final response = await http.post(
                    Uri.parse(url),
                    body: json.encode({
                      'email': emailController.text,
                      'password': passwordController.text,
                      'returnSecureToken': true,
                    }),
                  );
                  if (response.statusCode == 200) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                    );

                    print('Login successful');
                    print('Response body: ${response.body}');
                  } else {
                    print('Login failed');
                    print('Response status code: ${response.statusCode}');
                    print('Response body: ${response.body}');
                  }
                },
                child: Text(
                  'Најави се',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ),
            ),
            SizedBox(height: 13),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterPage()),
                );
              },
              child: Text(
                'Нов корисник? Регистрирај се',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeInput({
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
}
