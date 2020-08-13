import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  /// "https://api.openweathermap.org/data/2.5/weather?lat=$latitute&lon=$longtitute&appid=$apiKey";
  Future getData() async {
    http.Response response = await http.get(url);
    //print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
