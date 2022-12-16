import 'dart:async';

import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../weatherpage/weatherscreen.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({super.key});

  @override
  State<SplashPageWidget> createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    setduration();
  }

  setduration() {
    Timer(Duration(seconds: 3), Nextto);
  }

  Nextto() {
    Navigator.of(context).pushAndRemoveUntil(
        PageTransition(child: WeatherScreen(), type: PageTransitionType.fade),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: NetworkImage(
      //             "https://www.vhv.rs/dpng/d/427-4270068_gold-retro-decorative-frame-png-free-download-transparent.png"),
      //         fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "We show weather for you",
                style: TextStyle(fontSize: 50, color: Colors.grey),
              ),
              SizedBox(
                height: 140,
              ),
              InkWell(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 190, 188, 188)),
                    child: Text(
                      "Skip",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                onTap: () {
                  Nextto();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
