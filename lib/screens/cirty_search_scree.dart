import "package:flutter/material.dart";

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/city_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: null,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: "Enter City Name",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                    print(value);
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                color: Colors.blueAccent,
                child: Text(
                  "Get Weather",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
