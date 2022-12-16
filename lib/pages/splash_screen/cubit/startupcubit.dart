import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/splash_screen/cubit/startupstate.dart';

class StartupCubit extends Cubit<SatrtupState> {
  StartupCubit() : super(StartupLoading());

  fetchInitialData() async {
    emit(StartupLoading());
    await Future.delayed(Duration(seconds: 2));

    emit(StartupSuccess());
  }
}
