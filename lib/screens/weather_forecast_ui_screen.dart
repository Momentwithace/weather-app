
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WeatherForecastUIScreen extends StatefulWidget{
  const WeatherForecastUIScreen({super.key});

  @override
  State<WeatherForecastUIScreen> createState() => _WeatherForecastUIScreen();
}

class _WeatherForecastUIScreen extends State<WeatherForecastUIScreen> {
  @override
  Widget build(BuildContext buildContext){
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/img/sky.jpeg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(12.6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Expanded(child: Text("Germany Berlin",
                          style: TextStyle(color: Colors.white),
                          )
                          ),
                          Icon(Icons.sort,
                          color: Colors.white,
                          )
                        ],
                      ),
                      
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text("Today Oct 18 5:10",
                          style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.sunny, size: 70, color: Colors.amber,),
                              SizedBox(height: 4,),
                               Text("It's Sunny",
                          style: TextStyle(color: Colors.white, fontSize: 23),
                          )
                            ],
                          ),
                          Text( '23\u00B0',
                          style: TextStyle(color: Colors.white, fontSize: 120),)
                        ],
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      
                       
                    ],

                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(children: [
                      SizedBox(
                        height: 12,
                      ),
                      Icon(Icons.remove),
                      Text("Weather Today", style: TextStyle(
                        color: Colors.black,
                       fontWeight: FontWeight.w900,
                       fontSize: 20
                       ),
                       ),
                       SizedBox(
                        height: 20,
                       ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WeatherInfo(
                          color: Colors.yellow[600], 
                          iconData: Icons.sunny, 
                          temperature: '23', 
                          time: 13,
                          ),
                          WeatherInfo(
                          color: Colors.grey, 
                          iconData: Icons.cloud, 
                          temperature: '16', 
                          time: 09,
                          ),
                          WeatherInfo(
                          color: Colors.grey, 
                          iconData: Icons.cloudy_snowing, 
                          temperature: '3', 
                          time: 06,
                          ),
                          WeatherInfo(
                          color: Colors.amber, 
                          iconData: Icons.sunny, 
                          temperature: '23', 
                          time: 15,
                          )
                        ],
                       )
                    ]
                    ),
                  ),
                )
              ],
            ),

          )
        ],
      )
    );
  }
}

class WeatherInfo extends StatelessWidget{
  final IconData iconData;
  final int time;
  final String temperature;
  final Color? color;
  const WeatherInfo({
    super.key, 
    required this.iconData, 
    required this.time, 
    required this.temperature, 
    required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              iconData,
              size: 50,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$time ${validateTime(time)}",  
            ),
             SizedBox(
              height: 10,
            ),
            Text(
              "$temperature\u00B0",
              style: TextStyle(fontSize: 40),
            )
          ],
        )
      ],
    );
    
  }
  
  validateTime(int time) {
    if(time > 12 && time < 1){
      return "AM";
    }else {
      return "PM";
    }
  }

}