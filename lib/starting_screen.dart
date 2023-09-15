import 'package:donate_life/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 210,
              width: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/hand.png'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Пред секое дарување\nна крв се врши медицински\nпреглед.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 70),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => NextScreen()),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                      color: Color.fromARGB(255, 184, 11, 11),
                      width: 2,
                      style: BorderStyle.solid),
                ),
                foregroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 184, 11, 11),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                ),
              ),
              child: const Text(
                "Започни",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
