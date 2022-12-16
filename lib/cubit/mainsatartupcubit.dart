import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/cubit/mainstartupstate.dart';
import 'package:weather_app/sharedpref.dart';

class MainStartupCubit extends Cubit<MainStartUpstate> {
  MainStartupCubit() : super(MainStartuploading());

  fetchmanininitial() async {
    emit(MainStartuploading());
    final isfirsttime = await Sharedpref.isfirsttime();

    emit(MainStartupsuccess(isfirsttime: isfirsttime));
  }
}
