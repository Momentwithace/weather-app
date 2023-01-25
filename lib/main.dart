import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/weather_ui_screen.dart';

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
      home: NightWeatherUI(),
    );
  }
}

