library open_weather_util;

import 'dart:developer';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_application/model/open_weather.dart';

class OpenWeatherUtil {
  OpenWeatherUtil._();

  @OpenWeather('getEnvProperty', 'Get Envionmenr property from .env')
  static Future<String?> getEnvProperty({String? key}) async {
    await DotEnv().load(fileName: '.env');

    return DotEnv().env[key!];
  }

  static Future<bool> isOnline() async {
    List<InternetAddress> request = await InternetAddress.lookup(
      'www.google.com',
      type: InternetAddressType.IPv4,
    );

    if (request.isNotEmpty) return true;

    return false;
  }
}
