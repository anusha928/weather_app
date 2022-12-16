// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/data_response.dart';
import '../model/weathermodel.dart';

class WeatherRepository {
  Future<DataResponse<Weather>> fetchWeatherFromCity(
      {required String city}) async {
    try {
      var url = Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=791a267f6869402e9ed151332221512&q=$city&days=1&aqi=no&alerts=no",
      );
      final response = await http.get(url);
      final body = jsonDecode(response.body);
      print(Weather.fromJson(body));
      return DataResponse.success(Weather.fromJson(body));
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }

  Future<DataResponse<Weather>> fetchWeatherFromLatLong(
      {required double lat, required double long}) async {
    try {
      var url = Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=791a267f6869402e9ed151332221512&days=1&aqi=no&alerts=no&q=$lat,$long",
      );

      final response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final body = jsonDecode(response.body);
        print(Weather.fromJson(body));
        return DataResponse.success(Weather.fromJson(body));
      } else {
        final body = jsonDecode(response.body);
        print(body);
        return DataResponse.error(body['error']["message"]);
      }
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
