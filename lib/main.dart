import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'starting_screen.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 8),
      () => navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(
              height: 500,
            ),
            padding: EdgeInsets.only(top: 400),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text(
                    'Донирај',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Colors.black,
                        height: sqrt1_2),
                  ),
                ),
                Text(
                  'Спаси живот!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: Text(
                    'живот',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Color.fromARGB(255, 184, 11, 11),
                        height: sqrt1_2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
