import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:weather_app/pages/weatherpage/weatherpageWidget.dart';
import 'package:weather_app/resources/weather_repository.dart';

import '../../bloc/weaatherbloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(weatherRepository: WeatherRepository()),
      child: WeatherWidget(),
    );
  }
}
