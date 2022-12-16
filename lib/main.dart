import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:weather_app/pages/splash_screen/splashpage.dart';



void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
      home: SplashPage(),
    );
  }
}
