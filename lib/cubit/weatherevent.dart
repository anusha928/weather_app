import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDataByCity extends WeatherEvent {
  final String city;

  FetchDataByCity(this.city);
  @override
  List<Object?> get props => [city];
}

class FetchDataByLatLong extends WeatherEvent {
  final double latitude;
  final double longitude;

  FetchDataByLatLong({
    required this.latitude,
    required this.longitude,
  });
}
