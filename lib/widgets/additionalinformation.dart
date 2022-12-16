import 'package:flutter/material.dart';
import 'package:weather_app/model/weathermodel.dart';

class AdditionalInformation extends StatelessWidget {
  Weather weather;
  // final String wind;
  // final String humidity;
  // final String pressure;
   AdditionalInformation(
      {super.key,
      required this.weather,
      // required this.humidity,
      // required this.pressure,
      // required this.wind
      }
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wind",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white54),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Text(
                    "pressure",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white54),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Text(
                    "humidity",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white54),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weather.wind.toString() + " mph",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Text(
                    weather.pressure.toString() + " in",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Text(
                    weather.humidity.toString(),
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
