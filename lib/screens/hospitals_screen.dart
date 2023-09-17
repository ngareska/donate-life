import 'package:donate_life/dummy_data.dart';
import 'package:donate_life/models/Hospital.dart';
import 'package:donate_life/widgets/hospital_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class HospitalsPage extends StatefulWidget {
  @override
  State<HospitalsPage> createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
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
                target: LatLng(42.0140, 21.4036),
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
