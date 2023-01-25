// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math' as math;

class NightWeatherUI extends StatefulWidget {
  const NightWeatherUI({super.key});

  @override
  State<NightWeatherUI> createState() {
    return _NightWeatherUI();
  }
}

class _NightWeatherUI extends State<NightWeatherUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/img/night.jfif',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.location_on_rounded,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                  'Lagos',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  )
                              ),
                            ),
                            Icon(
                                Icons.drag_handle,
                                color: Colors.white
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              '23\u00B0',
                            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 120),
                          ),
                          Transform.rotate(
                              angle: -math.pi / 2,
                            child: Text(
                              'It\'s Windy',
                              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 22),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.maximize_rounded, color: Colors.grey,),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Weather Today',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WeatherSummary(
                              icon: Icons.wb_sunny_rounded,
                              iconColor: Colors.orangeAccent,
                              time: '03:00 AM',
                              temperature: '23\u00B0',
                            ),
                            WeatherSummary(
                              icon: Icons.wb_cloudy_outlined,
                              iconColor: Colors.black,
                              time: '06:00 AM',
                              temperature: '16\u00B0',
                            ),
                            WeatherSummary(
                              icon: Icons.cloudy_snowing,
                              iconColor: Colors.lightBlueAccent,
                              time: '09:00 AM',
                              temperature: '3\u00B0',
                            ),
                            WeatherSummary(
                              icon: Icons.wb_sunny_rounded,
                              iconColor: Colors.orangeAccent,
                              time: '12:00 PM',
                              temperature: '23\u00B0',
                            ),
                      ],
                    ),
                    ],
                  ),
              ),
            ],

          ),
          ),
      ],
      ),
    );
  }

}

class WeatherSummary extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temperature;
  final Color iconColor;
  const WeatherSummary({
    super.key,
    required this.icon,
    required this.time,
    required this.temperature,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(time, style: TextStyle(fontSize: 10),),
        SizedBox(
          height: 10.0,
        ),
        Text(temperature, style: TextStyle(fontSize: 35),),
      ],
    );
  }
}