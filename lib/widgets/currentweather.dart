import 'package:flutter/material.dart';

class Currentweather extends StatelessWidget {
  final String image;
  final String temp;
  final String location;
  final String text;
  const Currentweather(
      {super.key,
      required this.text,
      required this.image,
      required this.location,
      required this.temp});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          Text(text, style: TextStyle(fontSize: 20, color: Colors.white54)),
          SizedBox(
            height: 8,
          ),
          Text(
            temp + " °C",
            style: TextStyle(fontSize: 40, color: Colors.white54),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            location,
            style: TextStyle(fontSize: 22, color: Colors.white54),
          )
        ],
      ),
    );
  }
}
