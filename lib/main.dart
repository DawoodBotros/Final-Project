import 'package:flutter/material.dart';
import 'package:movies/Movies_App/Movies_app.dart';
import 'package:movies/MyLogin/MyLogin.dart';
import 'package:movies/MyLogin/register.dart';
import 'package:movies/WeatherApp/Weather_Process_Screen.dart';
import 'package:movies/WeatherApp/weatherapp.dart';
import 'package:movies/newsapp/NewsApp.dart';
import 'package:movies/Movies_App/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreens(),
      routes: {
        'register': (context) => Register(),
        'login': (context)    => MyLogin(),
      },
    );
  }
}