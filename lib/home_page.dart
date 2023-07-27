import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meteo_app/weather_client.dart';
import 'package:meteo_app/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weather;
  List<dynamic>? hourlyTemp;
  List<Widget>? hourlyCast;
  List<dynamic>? hourlyDate;
  List<Widget>? hourlyCastDate;

  Position? currentPosition;
  late bool servicePermission = false;
  late LocationPermission permission;

  String currentAddress = '';

  Future<Position> _getCurrentPosition() async {
    //checking for the permission to use location service
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      debugPrint("service disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  _getAddressFromCoordinates() async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates((currentPosition!.latitude), currentPosition!.longitude);
      Placemark place = placemark[0];
      setState(() {
        currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Your geo coordinates'),
                Text("Latitude: ${currentPosition?.latitude}  X  Longitude: ${currentPosition?.longitude} "),
                const SizedBox(height: 20),
                const Text('Your address'),
                Text(currentAddress),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () async {
                    currentPosition = await _getCurrentPosition();
                    await _getAddressFromCoordinates();
                  },
                  color: Colors.pinkAccent,
                  child: const Text('Get location'),
                ),
                const SizedBox(height: 60),
                const Text('Current weather'),
                const SizedBox(height: 20),
                const Icon(Icons.sunny),
                Text('${weather?.currentWeather['temperature'] ?? 0}C'),
                MaterialButton(
                  color: Colors.amber,
                  onPressed: () async {
                    weather = await WeatherClient().request();
                    print(weather?.currentWeather);
                    hourlyTemp = weather?.hourly['temperature_2m'];
                    hourlyDate = weather?.hourly['time'];
                    hourlyCast = hourlyTemp
                        ?.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('$e'),
                          ),
                        )
                        .toList();
                    hourlyCastDate = hourlyDate
                        ?.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('$e'),
                          ),
                        )
                        .toList();
                    setState(() {});
                  },
                  child: const Text('Get data'),
                ),
                ExpansionTile(
                  title: const Text('Hourly weather'),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: hourlyCastDate == null ? [const Text('empty')] : hourlyCastDate!,
                        ),
                        Column(
                          children: hourlyCast == null ? [const Text('empty')] : hourlyCast!,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
