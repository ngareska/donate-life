import 'package:donate_life/models/Hospital.dart';
import 'package:donate_life/models/location.dart';
import 'package:flutter/material.dart';

class HospitalForm extends StatefulWidget {
  final Function(Hospital) onSave;

  HospitalForm({required this.onSave});

  @override
  _HospitalFormState createState() => _HospitalFormState();
}

class _HospitalFormState extends State<HospitalForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nameLocationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  String selectedBloodType = 'A-'; // Default value for blood type

  final List<String> bloodTypes = ['A-', 'A+', 'B-', 'B+', 'O-', 'O+', 'AB-', 'AB+'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Додади нова болница')), // Center align the title
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Име'),
            ),
            TextField(
              controller: nameLocationController,
              decoration: InputDecoration(labelText: 'Локација'),
            ),
            DropdownButtonFormField(
              value: selectedBloodType,
              decoration: InputDecoration(labelText: 'Крвна група'),
              onChanged: (newValue) {
                setState(() {
                  selectedBloodType = newValue.toString();
                });
              },
              items: bloodTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Телефонски број'),
            ),
            TextField(
              controller: latitudeController,
              decoration: InputDecoration(labelText: 'Географска ширина'),
            ),
            TextField(
              controller: longitudeController,
              decoration: InputDecoration(labelText: 'Географска должина'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Излези',
            style: TextStyle(
                color: Color.fromARGB(
                    255, 184, 11, 11)), // Set the text color to red
          ),
        ),
        TextButton(
          onPressed: () {
            final newHospital = Hospital(
              id: UniqueKey().toString(),
              name: nameController.text,
              nameLocation: nameLocationController.text,
              bloodtype: selectedBloodType,
              phoneNumber: phoneNumberController.text,
              location: Location(
                latitude: double.parse(latitudeController.text),
                longitude: double.parse(longitudeController.text),
              ),
            );

            widget.onSave(newHospital);

            Navigator.of(context).pop();
          },
          child: Text(
            'Зачувај',
            style: TextStyle(
                color: Color.fromARGB(
                    255, 184, 11, 11)), // Set the text color to red
          ),
        ),
      ],
    );
  }
}
