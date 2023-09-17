import 'package:donate_life/models/Hospital.dart';
import 'package:donate_life/models/location.dart';

const DUMMY_HOSPITALS = const [
  Hospital(
    id: 'h1',
    name: 'Аџибадем Систина',
    nameLocation: 'Скопје',
    bloodtype: 'A-',
    phoneNumber: '02 309 9500',
    location: Location(
      latitude: 42.0140,
      longitude: 21.4036,
    ),
  ),
  Hospital(
    id: 'h2',
    name: 'Градска болница 8-ми септември',
    nameLocation: 'Скопје',
    bloodtype: 'O-',
    phoneNumber: '02 308 7400',
    location: Location(
      latitude: 42.0056838095,
      longitude: 21.4029176906,
    ),
  ),
];
