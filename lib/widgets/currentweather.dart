import 'package:flutter/material.dart';
import 'package:weather_app/model/weathermodel.dart';

class Currentweather extends StatelessWidget {
  Weather weather;
  // final String image;
  // final String temp;
  // final String location;
  // final String text;
  Currentweather({
    super.key,
    required this.weather,
    // required this.text,
    // required this.image,
    // required this.location,
    // required this.temp
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          // Image.network(
          //   weather.icon,
          //   width: 120,
          //   height: 120,
          //   fit: BoxFit.cover,
          // ),
          Text(weather.text,
              style: TextStyle(fontSize: 20, color: Colors.white54)),
          SizedBox(
            height: 8,
          ),
          Text(
            weather.temp.toString() + " °C",
            style: TextStyle(fontSize: 40, color: Colors.white54),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            weather.city.toString(),
            style: TextStyle(fontSize: 22, color: Colors.white54),
          )
        ],
      ),
    );
  }
}
