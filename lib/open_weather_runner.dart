import 'package:flutter/material.dart';
import 'package:open_weather_application/views/open_weather_splash.dart';

class OpenWeatherRunner extends StatelessWidget {
  const OpenWeatherRunner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OpenWeatherSplashScreen(),
    );
  }
}
