import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:weather_app/screens/night_weather_ui_screen.dart';
=======
import 'package:get/get.dart';
import 'package:weather_app/screens/weather_ui_screen.dart';
>>>>>>> bd68a6d44a127044d0f98b2a24910b503ddf4ad7

import 'screens/night_weather_ui_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Weather App',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: NightWeatherUI(),
    );
  }
}

