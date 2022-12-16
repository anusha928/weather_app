import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:weather_app/bloc/weaatherbloc.dart';
import 'package:weather_app/cubit/weatherevent.dart';
import 'package:weather_app/cubit/weatherstate.dart';
import 'package:weather_app/pages/splash_screen/splashpage.dart';
import 'package:weather_app/securestorage.dart';

import 'package:weather_app/widgets/additionalinformation.dart';
import 'package:weather_app/widgets/currentweather.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initalizeStorage();
  }

  initalizeStorage() async {
    final _res = await StorageUtil.getcityname();
    _controller.text = _res ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          backgroundColor: Colors.white12,
          title: Text(
            "Weather App",
            style: TextStyle(color: Colors.white54),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                      child: SplashPage(), type: PageTransitionType.fade),
                  (route) => false);
            },
            color: Colors.white54,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white24),
              child: TextFormField(
                textInputAction: TextInputAction.search,
                controller: _controller,
                onSaved: (newValue) => {},
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    hintText: "search_city",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 68, 67, 67)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10)),
              )),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white12),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
            onTap: () async {
              if (_controller.text.isEmpty) {
                final LocationPermission = await Permission.location.request();
                if (LocationPermission.isGranted) {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  context.read<WeatherBloc>().add(
                        FetchDataByLatLong(
                          latitude: position.latitude,
                          longitude: position.longitude,
                        ),
                      );
                }
              } else {
                StorageUtil.setcityname(_controller.text);
                context
                    .read<WeatherBloc>()
                    .add(FetchDataByCity(_controller.text));
              }
            },
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is Weatherloading) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.white10,
                    radius: 20,
                  ),
                );
              } else if (state is Weathererror) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is Weathersuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Currentweather(
                      weather: state.weather,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AdditionalInformation(weather: state.weather)
                  ],
                );
              } else {
                return Container(
                    // //color: Colors.white24,
                    // child: const Center(
                    //   child: CupertinoActivityIndicator(),
                    // ),
                    );
              }
            },
          )
        ])));
  }
}
