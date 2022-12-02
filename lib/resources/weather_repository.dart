// ignore_for_file: avoid_print
import 'dart:convert';


import 'package:http/http.dart' as http;
import '../model/weathermodel.dart';

class WeatherRepository {
  Future<Weather> fetchdata(String? location) async {
    
   
    var url = Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=d232bd54f57b4d329e484624220112&q=$location&days=1&aqi=no&alerts=no");

    final response = await http.get(url);
    
    final body = jsonDecode(response.body);
    print(Weather.fromJson(body));
    return Weather.fromJson(body);
  }
}
