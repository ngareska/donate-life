import 'package:donate_life/home_screen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
      Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()), 
      );
    });;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 330, 
          height: 380,
          child: Card(
            elevation: 2, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Color.fromARGB(255, 184, 11, 11), width: 3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png', 
                  width: 135, 
                  height: 135, 
                ),
                Text(
                  'Ви благодариме!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Вашата донација\n е успешно примена.',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Text(
                  'Со секоја донација, спасувате\n еден живот.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Делата зборуваат погласно од\n зборовите!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 23),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
