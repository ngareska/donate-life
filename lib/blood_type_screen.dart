import 'package:donate_life/models/blood_types.dart';
import 'package:flutter/material.dart';

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
                  children: BloodTypes.bloodTypes.sublist(0, 4).map((bloodType) {
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

class BloodTypeTile extends StatefulWidget {
  final String bloodType;

  const BloodTypeTile({Key? key, required this.bloodType}) : super(key: key);

  @override
  _BloodTypeTileState createState() => _BloodTypeTileState();
}

class _BloodTypeTileState extends State<BloodTypeTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        Navigator.pop(context, isSelected ? widget.bloodType : null);
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Color.fromARGB(255, 184, 11, 11),
            width: 3,
          ),
          color: isSelected ? Color.fromARGB(255, 184, 11, 11) : Colors.white,
        ),
        child: Center(
          child: Text(
            widget.bloodType,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color:
                  isSelected ? Colors.white : Color.fromARGB(255, 184, 11, 11),
            ),
          ),
        ),
      ),
    );
  }
}
