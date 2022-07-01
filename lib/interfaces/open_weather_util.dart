library open_weather_util;

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

  static List<double> getCoordinates(String? states) {
    switch (states) {
      case 'Penang':
        return [5.416393, 100.332680];
      case 'Johore':
        return [2.048110, 103.382233];
      case 'Kedah':
        return [5.8098265, 100.6715035];
      case 'Kelantan':
        return [5.4021302, 102.0635972];
      case 'Malacca':
        return [2.3293744, 102.2880962];
      case 'Negeri Sembilan':
        return [2.7831895, 102.1925319];
      case 'Pahang':
        return [3.6168822, 102.5994547];
      case 'Perak':
        return [4.812181, 100.9797908];
      case 'Perlis':
        return [6.4868392, 100.2577623];
      case 'Sabah':
        return [5.4257359, 117.0326392];
      case 'Sarawak':
        return [2.5023855, 112.9547283];
      case 'Selangor':
        return [3.2083304, 101.304146];
      case 'Terengganu':
        return [4.8630743, 102.9949297];
      case 'Kuala Lumpur':
        return [3.1516964, 101.6942371];
      case 'Labuan':
        return [5.3168336, 115.2198613];
      default:
        return [0.0, 0.0];
    }
  }
}
