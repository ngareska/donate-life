import 'package:donate_life/screens/login_screen.dart';
import 'package:donate_life/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/info_screen.dart';
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
        MaterialPageRoute(builder: (BuildContext context) => InfoPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/', 
      routes: {
        '/': (context) => SplashScreen(), 
        '/second': (context) => InfoPage(),
        'login_screen': (context) =>
            LoginScreen(), 
      },
    );
  }
}
