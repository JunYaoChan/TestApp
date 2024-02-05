import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_project/constants/consts.dart';
import 'package:test_project/services/DateTimeServices.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

import '../Theme.dart';

class WeatherWindow extends StatefulWidget {
  const WeatherWindow({super.key});

  @override
  State<WeatherWindow> createState() => _WeatherWindowState();
}

class _WeatherWindowState extends State<WeatherWindow> {

  final WeatherFactory weatherFactory = WeatherFactory(weatherAPIKey);

  DateTime now = DateTime.now();

  Weather? weather;

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  void getLocationWeather() async {
    print('getting permissions');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print('perms denied');
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('perms denied again');
        return;
      }
    } else if (permission == LocationPermission.deniedForever) {
      print('perms denied forever');
      return;
    } else {
      print('perms granted');
      Position position = await Geolocator.getCurrentPosition(forceAndroidLocationManager: true, desiredAccuracy: LocationAccuracy.medium);
      print(position);

      double lon = position.longitude;
      double lat = position.latitude;
      print('Longitude: $lon, Latitude: $lat');

      weather = await weatherFactory.currentWeatherByLocation(lat, lon);
      print(weather);
      setState(() {
        print('setting state');
      });

    }
}


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          const Image(image: AssetImage('assets/window.png')),
          Center(child: buildWeather()),
        ],
      ),
    );
  }

  Widget buildWeather() {
    TextStyle titleStyle = const TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: 'Poppins',
    );

    TextStyle subTitleStyle = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: 'Poppins',
    );

    if (weather == null) {
      return const SpinKitCircle(color: TestAppColour.primaryPurple);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${weather!.temperature!.celsius!.toStringAsFixed(0)}°C', style: titleStyle),
        Text('${weather!.areaName!}, ${weather!.country!}', style: subTitleStyle),
        Text(TimeServices.nowAsString())
      ],
    );
  }










}
