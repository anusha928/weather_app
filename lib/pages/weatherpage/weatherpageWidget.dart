import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:weather_app/resources/weather_repository.dart';
import 'package:weather_app/widgets/additionalinformation.dart';
import 'package:weather_app/widgets/currentweather.dart';

import '../../model/weathermodel.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final TextEditingController _controller = TextEditingController();
  WeatherRepository repository = WeatherRepository();
  Weather? data;

  Future<void> getdata([String? location = "Kathmandu"]) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
   
    data = await repository.fetchdata(location);
    print(location);
  }

  Future getlocation() async {
    final LocationPermission = await Permission.location.request();
    if (LocationPermission.isGranted) {
      final controller = _controller;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position != null) {
        print(position);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getdata();
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
            onPressed: () {},
            color: Colors.white54,
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Currentweather(
                          image: "https:${data!.icon}",
                          text: "${data!.text}",
                          location: "${data!.city}",
                          temp: "${data!.temp}"),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white24),
                          child: TextFormField(
                            textInputAction: TextInputAction.search,
                            controller: _controller,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: "search_city",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 68, 67, 67)),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10)),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
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
                        onTap: () {
                          final location = _controller.text;
                          getdata(location);
                          print(location);

                          setState(() {
                            final location = _controller.text;
                            print(location);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AdditionalInformation(
                          humidity: "${data!.humidity}",
                          pressure: "${data!.pressure}",
                          wind: "${data!.wind}")
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              }),
        ));
  }
}
