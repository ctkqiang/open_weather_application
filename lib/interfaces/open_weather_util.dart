library open_weather_util;

import 'package:dotenv/dotenv.dart';
import 'package:open_weather_application/model/open_weather.dart';

class OpenWeatherUtil {
  OpenWeatherUtil._();

  @OpenWeather('getEnvProperty', 'Get Envionmenr property from .env')
  static String? getEnvProperty({String? key}) {
    DotEnv env = DotEnv(includePlatformEnvironment: true)..load();
    return env[key!]!;
  }
}
