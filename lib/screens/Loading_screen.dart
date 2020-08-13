import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hava_durumu_app/screens/location_screen.dart';
import 'package:hava_durumu_app/services/network.dart';
import 'package:hava_durumu_app/services/weather.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

const apiKey = "174280d38873a45b1d5c6b233654f9ce";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longtitute;
  double latitute;

  Future<void> getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    //print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.grey,
          size: 100.0,
        ),
      ),
    );
  }
}
