import 'package:flutter/material.dart';
import 'package:open_weather_application/interfaces/open_weather_util.dart';

class OpenWeatherMain extends StatefulWidget {
  const OpenWeatherMain({Key? key}) : super(key: key);

  @override
  State<OpenWeatherMain> createState() => _OpenWeatherMainState();
}

class _OpenWeatherMainState extends State<OpenWeatherMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(OpenWeatherUtil.getEnvProperty(key: 'OPEN_WEATHER_API')!),
      ),
    );
  }
}
