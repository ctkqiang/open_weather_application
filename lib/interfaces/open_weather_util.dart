library open_weather_util;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_application/model/open_weather.dart';

class OpenWeatherUtil {
  OpenWeatherUtil._();

  @OpenWeather('getEnvProperty', 'Get Envionmenr property from .env')
  static Future<String?> getEnvProperty({String? key}) async {
    await DotEnv().load(fileName: '.env');

    return DotEnv().env[key!];
  }
}
