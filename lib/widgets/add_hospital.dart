import 'package:flutter/material.dart';
import 'package:donate_life/models/Hospital.dart';
import 'package:donate_life/models/location.dart';

class HospitalForm extends StatefulWidget {
  final Function(Hospital) onSave;
  final List<String> bloodTypes;

  HospitalForm({required this.onSave, required this.bloodTypes});

  @override
  _HospitalFormState createState() => _HospitalFormState();
}

class _HospitalFormState extends State<HospitalForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nameLocationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  late String selectedBloodType; 

  @override
  void initState() {
    super.initState();
    selectedBloodType = widget.bloodTypes[0]; 
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Додади нова болница')),
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
              items: widget.bloodTypes.map<DropdownMenuItem<String>>((String value) {
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
            'Назад',
            style: TextStyle(
                color: Color.fromARGB(
                    255, 184, 11, 11)),
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
                    255, 184, 11, 11)),
          ),
        ),
      ],
    );
  }
}
