import 'package:donate_life/models/location.dart';

class Hospital {
  final String id;
  final String name;
  final String nameLocation;
  final String bloodtype;
  final String phoneNumber;
  final Location location;

  const Hospital(
      {required this.id,
      required this.name,
      required this.nameLocation,
      required this.bloodtype,
      required this.phoneNumber,
      required this.location});
}
