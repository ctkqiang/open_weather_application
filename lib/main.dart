import 'package:flutter/material.dart';
import 'package:open_weather_application/constant/open_weather_themes.dart';
import 'package:open_weather_application/model/open_weather.dart';

@OpenWeather('main', 'This runs the programme')
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (_) {
    /// Onstart [Error] Handling
    ErrorWidget.builder = (details) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: OpenWeatherThemes.errorAccent,
          body: Center(child: Text(details.exception.toString())),
        ),
      );
    };
  }
}
