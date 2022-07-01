// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_weather_application/constant/open_weather_themes.dart';
import 'package:open_weather_application/views/open_weather_main.dart';

class OpenWeatherSplashScreen extends StatefulWidget {
  int? duration;
  OpenWeatherSplashScreen({Key? key, this.duration}) : super(key: key);

  @override
  State<OpenWeatherSplashScreen> createState() =>
      _OpenWeatherSplashScreenState();
}

class _OpenWeatherSplashScreenState extends State<OpenWeatherSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: widget.duration!), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OpenWeatherMain()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: OpenWeatherThemes.whiteAccent,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child: Image.asset('assets/images/app.png'),
        ),
      ),
    );
  }
}
