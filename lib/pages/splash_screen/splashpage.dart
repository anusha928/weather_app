import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/splash_screen/cubit/startupcubit.dart';
import 'package:weather_app/pages/splash_screen/splashpage_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartupCubit(),
      child: SplashPageWidget(),
    );
  }
}
