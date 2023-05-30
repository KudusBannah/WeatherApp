import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_screen.dart';
import 'package:weather_app/pages/loading_screen.dart';
import 'package:weather_app/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const LoadingScreen(),
      '/weather': (context) => const WeatherScreen(),
      '/location': (context) => const EditLocation(),
    },
  ));
}
