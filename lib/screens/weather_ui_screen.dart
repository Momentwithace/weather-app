// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:weather_app/controllers/change_temp_controller.dart';

class WeatherUIScreen extends StatefulWidget {
  const WeatherUIScreen({super.key});

  @override
  State<WeatherUIScreen> createState() => _WeatherUIScreenState();
}

class _WeatherUIScreenState extends State<WeatherUIScreen> {
  final ctr = Get.put(ChangeTempController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/img/morning.jfif',
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
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            'Tuscany',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.sort,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<ChangeTempController>(builder: (ctr) {
                        return Text(
                          '${ctr.temp} \u00B0',
                          style: TextStyle(color: Colors.white, fontSize: 120),
                        );
                      }),
                      Transform.rotate(
                        angle: -math.pi / 2,
                        child: Text(
                          'It\'s sunny',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.withOpacity(.3),
                        ),
                        height: 3.5,
                        width: 35,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Weather Today',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      // SizedBox(
                      //   height: 45,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                ctr.increseTemprature();
                              },
                              child: Text('Change Data')),
                          ElevatedButton(
                              onPressed: () {
                                ctr.navigateToHome();
                              },
                              child: Text('go to home'))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HourlyInfo(
                            icon: Icons.sunny,
                            time: 09,
                            temperature: '23',
                            color: Colors.yellow[600],
                          ),
                          HourlyInfo(
                            icon: Icons.cloud,
                            time: 13,
                            temperature: '3',
                            color: Colors.blue[100],
                          ),
                          HourlyInfo(
                            icon: Icons.cloudy_snowing,
                            time: 16,
                            temperature: '12',
                            color: Colors.amber[300],
                          ),
                          HourlyInfo(
                            icon: Icons.sunny,
                            time: 19,
                            temperature: '35',
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class HourlyInfo extends StatelessWidget {
  final IconData icon;
  final int time;
  final String temperature;
  final Color? color;
  const HourlyInfo({
    Key? key,
    required this.icon,
    required this.time,
    required this.temperature,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          Icon(
            icon,
            size: 50,
            color: color,
          ),
          SizedBox(
            height: 10,
          ),
          Text('$time ${validateTime(time)}'),
          SizedBox(
            height: 10,
          ),
          Text(
            '$temperature\u00B0',
            style: TextStyle(fontSize: 40),
          ),
        ])
      ],
    );
  }

  validateTime(int time) {
    if (time <= 12) {
      return 'AM';
    } else {
      return 'PM';
    }
  }
}
