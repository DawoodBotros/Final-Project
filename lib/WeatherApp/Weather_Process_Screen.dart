import 'package:flutter/material.dart';
import 'package:movies/WeatherApp/Loding_Screen.dart';

class WeatherProccess extends StatefulWidget {
  @override
  State<WeatherProccess> createState() => _WeatherProccessState();
}

class _WeatherProccessState extends State<WeatherProccess> {
  bool looding = false;
  @override
  Widget build(BuildContext context) {
    return looding ?LodingScreen() :Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Process Weather Screen '),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/rainy.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weather Degree: 22° C Date: 7/7/2022 Time:1.11 PM",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
