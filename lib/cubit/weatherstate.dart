import 'package:equatable/equatable.dart';

class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Weatherinitial extends WeatherState {}

class Weatherloading extends WeatherState {}

class Weathersuccess<T> extends WeatherState {
  final T weather;

  Weathersuccess({required this.weather});

  @override
  List<T> get props => [weather];
}

class Weathererror extends WeatherState {
  final String message;

  Weathererror({required this.message});
}
