import 'package:donate_life/screens/success_screen.dart';
import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final String hospitalName;
  final String bloodType;

  ConfirmationPage({
    required this.hospitalName,
    required this.bloodType,
  });

  String getCompatibleBloodTypes(String bloodType) {
    if (bloodType == 'A-') {
      return 'A- или O-';
    } else if (bloodType == 'Б-') {
      return 'Б- или O-';
    } else if (bloodType == 'O-') {
      return 'O-';
    } else if (bloodType == 'АБ-') {
      return 'AБ-, A-, Б- или O-';
    } else if (bloodType == 'A+') {
      return 'A+, A-, O+ или O-';
    } else if (bloodType == 'O+') {
      return 'О+ или О-';
    } else if (bloodType == 'Б+') {
      return 'Б+, Б-, О+ или О-';
    }
    return 'сите';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey[700]),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'БAРАЊЕ ЗА ПОТВРДА',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Доколку Вашата крвна група се совпаѓа со компатибилната на потребната',
              style: TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
            Text(
              'Ве молиме кликнете потврди за да донирате',
              style: TextStyle(
                fontSize: 13,
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Color.fromARGB(255, 124, 124, 124),
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '$hospitalName',
              style: TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'има потреба од крв',
              style: TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 23),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Color.fromARGB(255, 184, 11, 11),
                  width: 3,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 140, vertical: 40),
                child: Text(
                  '$bloodType',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 184, 11, 11),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${bloodType} може да прима само од: ${getCompatibleBloodTypes(bloodType)} !',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 184, 11, 11),
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuccessPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 184, 11, 11),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                minimumSize: Size(338, 50),
              ),
              child: const Text(
                "Потврди",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
