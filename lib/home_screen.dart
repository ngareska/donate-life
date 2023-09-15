import 'package:donate_life/hospitals_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Донирај живот'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 184, 11, 11),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/hospital.png'),
            SizedBox(height: 40),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HospitalsScreen()),
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
                  EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                ),
              ),
              child: const Text(
                "Пронајди болници",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
