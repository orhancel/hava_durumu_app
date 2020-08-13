import 'package:flutter/material.dart';
import 'package:hava_durumu_app/screens/cirty_search_scree.dart';
import 'package:hava_durumu_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature;
  String cityName;
  int condition;
  String weatherIcon;
  String weatherMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherValues(widget.locationWeather);
  }

  void weatherValues(dynamic weatherData) {
    setState(() {
      temperature = 0;
      cityName = "";
      condition = 0;
      weatherIcon = "Error";
      weatherMessage = "Unable to get Data";
    });
    print("weatherdata main temp");
    print(weatherData["main"]["temp"].runtimeType);
    //double temp = weatherData["main"]["temp"];
    //temperature = temp.toInt();
    if (weatherData["main"]["temp"] is double) {
      temperature = weatherData["main"]["temp"].toInt();
    } else {
      temperature = weatherData["main"]["temp"];
    }

    condition = weatherData["weather"][0]["id"];
    cityName = weatherData["name"];
    weatherIcon = weatherModel.getWeatherIcon(condition);
    weatherMessage = weatherModel.getMessage(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedName != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typedName);
                        weatherValues(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: TextStyle(fontSize: 100, color: Colors.white),
                    ),
                    Text(
                      "$weatherIcon",
                      style: TextStyle(fontSize: 100, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                      fontFamily: "Spartan MB"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
