import 'package:flutter/material.dart';
import 'package:movies/Widget/Weather_Widget.dart';
import 'package:movies/Widget/gridview_data.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Sohag"),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.data_object_rounded)),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/sunny.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WeatherWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                GridData(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
