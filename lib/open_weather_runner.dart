import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_application/constant/open_weather_themes.dart';
import 'package:open_weather_application/translations/locale_keys.g.dart';
import 'package:open_weather_application/views/open_weather_splash.dart';

// ignore: must_be_immutable
class OpenWeatherRunner extends StatefulWidget {
  bool? isdebugMode;
  OpenWeatherRunner({Key? key, this.isdebugMode}) : super(key: key);

  @override
  State<OpenWeatherRunner> createState() => _OpenWeatherRunnerState();
}

class _OpenWeatherRunnerState extends State<OpenWeatherRunner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: widget.isdebugMode!,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: OpenWeatherThemes.primaryAccent,
        ),
      ),
      title: 'Open Weather Demo App',
      home: OpenWeatherSplashScreen(duration: 2),
    );
  }
}
