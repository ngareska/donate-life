import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:donate_life/screens/hospitals_screen.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _handleLogout(BuildContext context) async {
    try {
      await _auth.signOut(); // Sign out the user
      Navigator.of(context).pop(); // Close the drawer
      Navigator.of(context).pushReplacementNamed('login_screen');
    } catch (e) {
      // Handle any errors during logout
      print('Logout failed: $e');
    }
  }

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
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.logout), // Add your logout icon
              title: Text('Одјави се'),
              onTap: () => _handleLogout(context), // Call the logout function
            ),
          ],
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
                  MaterialPageRoute(builder: (_) => HospitalsPage()),
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
