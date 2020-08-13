import 'package:hava_durumu_app/services/location.dart';
import 'network.dart';

const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";
const apiKey = "174280d38873a45b1d5c6b233654f9ce";

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    print("getLocation");
    Location location = Location();
    await location.getCurrentLocation();
    print("got Location");
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${location.latitute}&lon=${location.longtitute}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    //print("weatherData");
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    print("get city weather in $cityName");
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    //print(weatherData);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s summer time';
    } else if (temp > 20) {
      return 'Time for shorts';
    } else if (temp < 10) {
      return 'You\'ll need a scarf';
    } else {
      return 'Bring a coat';
    }
  }
}
