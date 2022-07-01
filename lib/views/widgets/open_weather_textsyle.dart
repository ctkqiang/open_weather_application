library open_weather_textstyle;

import 'package:flutter/material.dart';

class OpenWeatherTextsyle {
  OpenWeatherTextsyle._();

  static TextStyle defaultTextStyle({
    @required Color? color,
    @required double? size,
  }) {
    return TextStyle(color: color!, fontSize: size!);
  }
}
