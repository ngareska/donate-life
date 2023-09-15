import 'package:donate_life/confirmation_screen.dart';
import 'package:donate_life/dummy_data.dart';
import 'package:donate_life/models/Hospital.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class HospitalsScreen extends StatefulWidget {
  @override
  State<HospitalsScreen> createState() => _HospitalsScreenState();
}

class _HospitalsScreenState extends State<HospitalsScreen> {
  final List<Hospital> hospitals = DUMMY_HOSPITALS;
  Completer<GoogleMapController> _controller = Completer();
  Hospital? selectedHospital;

  void _moveToSelectedHospital() async {
    if (selectedHospital != null) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(
            selectedHospital!.location.latitude,
            selectedHospital!.location.longitude,
          ),
          15.0,
        ),
      );
    }
  }

  Set<Marker> _createMarkers(List<Hospital> hospitals) {
    return hospitals.map((hospital) {
      return Marker(
        markerId: MarkerId(hospital.id),
        position:
            LatLng(hospital.location.latitude, hospital.location.longitude),
        infoWindow: InfoWindow(title: hospital.name),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Пронајди болници'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 184, 11, 11),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  42.0140, 21.4036),
                zoom: 12.0,
              ),
              markers: _createMarkers(hospitals),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                return HospitalCard(
                  hospital: hospitals[index],
                  onTap: () {
                    setState(() {
                      selectedHospital = hospitals[index];
                    });
                    _moveToSelectedHospital();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final Hospital hospital;
  final VoidCallback? onTap;

  HospitalCard({required this.hospital, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Color.fromARGB(255, 184, 11, 11), width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 184, 11, 11),
                  child: Text(
                    hospital.bloodtypes[0],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospital.name + '\nима потреба од крв',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Телефонски број: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 184, 182, 182)),
                ),
                Text(hospital.phoneNumber,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ],
            ),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Локација: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 184, 182, 182),
                      ),
                    ),
                    Text(
                      hospital.nameLocation,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        ', кликни ТУКА',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ConfirmationScreen(
                              hospitalName: hospital.name,
                              bloodType: hospital.bloodtypes[0])),
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
