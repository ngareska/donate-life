import 'package:donate_life/widgets/blood_type_tile.dart';
import 'package:flutter/material.dart';
import 'package:donate_life/models/blood_types.dart';

class BloodTypeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Крвна група",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "Ве молиме одберете ја Вашата крвна група",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children:
                      BloodTypes.bloodTypes.sublist(0, 4).map((bloodType) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: BloodTypeTile(bloodType: bloodType),
                    );
                  }).toList(),
                ),
                SizedBox(width: 16),
                Column(
                  children: BloodTypes.bloodTypes.sublist(4).map((bloodType) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: BloodTypeTile(bloodType: bloodType),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
