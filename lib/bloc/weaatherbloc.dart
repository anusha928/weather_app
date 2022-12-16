import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weatherevent.dart';
import 'package:weather_app/cubit/weatherstate.dart';
import 'package:weather_app/resources/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(Weatherinitial()) {
    on<FetchDataByCity>((event, emit) async {
      emit(Weatherloading());
      final _res =
          await weatherRepository.fetchWeatherFromCity(city: event.city);
      if (_res.status) {
        emit(Weathersuccess(weather: _res.data));
      } else {
        emit(Weathererror(message: _res.message));
      }
    });

    on<FetchDataByLatLong>((event, emit) async {
      emit(Weatherloading());
      final _res = await weatherRepository.fetchWeatherFromLatLong(
        lat: event.latitude,
        long: event.longitude,
      );
      if (_res.status) {
        emit(Weathersuccess(weather: _res.data));
      } else {
        emit(Weathererror(message: _res.message));
      }
    });
  }
}
