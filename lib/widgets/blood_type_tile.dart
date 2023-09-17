import 'package:flutter/material.dart';

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
