import 'dart:async';
import 'dart:math';
import 'package:donate_life/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(
              height:  MediaQuery.of(context).size.height * 0.6,
            ),
            padding: EdgeInsets.only(top: 375),
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
