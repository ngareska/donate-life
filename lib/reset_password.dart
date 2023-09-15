import 'package:donate_life/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerificationCodeInputScreen extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController(); // Add this line


  Future<void> confirmPasswordReset(BuildContext context) async {
    try {
      await FirebaseAuth.instance.confirmPasswordReset(
        code: codeController.text,
        newPassword: newPasswordController.text,
      );
      // Password reset is successful, navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()), // Navigate to login screen
      );
    } catch (e) {
      // Handle errors (e.g., invalid code)
      print('Error confirming password reset: $e');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error confirming password reset'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Потврда на код за потврда'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: 'Код за потврда',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Нова лозинка',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => confirmPasswordReset(context),
              child: Text('Потврди'),
            ),
          ],
        ),
      ),
    );
  }
}
