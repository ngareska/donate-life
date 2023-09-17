import 'package:donate_life/widgets/login_input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:donate_life/screens/home_screen.dart';
import 'package:donate_life/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _buildEmailInput(),
            _buildPasswordInput(),
            _buildForgotPasswordText(),
            SizedBox(height: 20),
            _buildLoginButton(context),
            SizedBox(height: 13),
            _buildRegisterText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Логирај се',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return LoginInput(
      labelText: 'Корисничко име (Е-mail)',
      controller: emailController,
      obscureText: false,
    );
  }

  Widget _buildPasswordInput() {
    return LoginInput(
      labelText: 'Лозинка',
      controller: passwordController,
      obscureText: true,
    );
  }

  Widget _buildForgotPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(right: 212),
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
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      height: 50,
      width: 360,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 184, 11, 11),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: () async {
          final url =
              'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBcobkvJIoDRTk7xCm759EgSIYQpiqHFIA'; 
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
    );
  }

  Widget _buildRegisterText(BuildContext context) {
    return TextButton(
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
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
