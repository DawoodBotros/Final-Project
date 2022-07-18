import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Today",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        Text(
          "April 19,2022",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20,),
        Text(
          "17ºC",
          style: TextStyle(fontSize: 40,color: Colors.white),
        ),
        Text(
          "Feels like 17ºC",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

}