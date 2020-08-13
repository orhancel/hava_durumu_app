import 'package:flutter/material.dart';
import 'package:hava_durumu_app/screens/location_screen.dart';
import 'screens/Loading_screen.dart';
import 'screens/location_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
      //home: LocationScreen(),
    );
  }
}
