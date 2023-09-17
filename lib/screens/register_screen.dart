import 'package:donate_life/screens/blood_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:donate_life/screens/home_screen.dart';
import 'package:donate_life/widgets/register_input.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();
  final TextEditingController dateBirthController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    bloodTypeController.dispose();
    dateBirthController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      FocusScope.of(context).requestFocus(FocusNode());
      dateBirthController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  void _handleBloodTypeTap() async {
    final bloodType = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BloodTypeSelection()),
    );

    if (bloodType != null) {
      FocusScope.of(context).requestFocus(FocusNode());
      bloodTypeController.text = bloodType;
    }
  }

  Future<void> _registerUser() async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBcobkvJIoDRTk7xCm759EgSIYQpiqHFIA';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'password': passwordController.text,
          'birthDate': dateBirthController.text,
          'bloodType': bloodTypeController.text,
          'email': emailController.text,
          'phoneNumber': phoneNumberController.text,
          'returnSecureToken': true,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final errorMessage = responseData['error']['message'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: $errorMessage'),
          ),
        );
      }
    } catch (error) {
      print('Error during registration: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed. Please try again later.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey[700]),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Регистрација",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Ве молиме внесете ги Вашите податоци за да продолжите",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 124, 124, 124),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, left: 4),
                          child: Row(
                            children: [
                              Text(
                                "Кориснички податоци",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RegisterInput(
                          labelText: "Име",
                          controller: firstNameController,
                          key: Key("ime"),
                        ),
                        SizedBox(width: 10),
                        RegisterInput(
                          labelText: "Презиме",
                          controller: lastNameController,
                          key: Key("prezime"),
                        ),
                        RegisterInput(
                          labelText: "Лозинка",
                          controller: passwordController,
                          obscureText: true,
                        ),
                        RegisterInput(
                          labelText: "Датум на раѓање",
                          controller: dateBirthController,
                          context: context,
                          onTap: () => _selectDate(context),
                          icon: Icons.calendar_today,
                        ),
                        RegisterInput(
                          labelText: "Крвна група",
                          controller: bloodTypeController,
                          onTap: _handleBloodTypeTap,
                          context: context,
                          icon: Icons.arrow_forward_ios,
                        ),
                        RegisterInput(
                          labelText: "E-mail",
                          controller: emailController,
                        ),
                        RegisterInput(
                          labelText: "Телефонски број",
                          controller: phoneNumberController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _registerUser,
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 184, 11, 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: Size(360, 50),
                        ),
                        child: const Text(
                          "Регистрирај се",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
