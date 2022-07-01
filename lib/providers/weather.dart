import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather_application/interfaces/open_weather_http_handler.dart';
import 'package:open_weather_application/interfaces/open_weather_util.dart';

class Weather with ChangeNotifier {
  final String endpoint = 'https://api.openweathermap.org/data/2.5/weather';
  final String apikey = ''; // Replace it to your API_KEY

  int? status;

  double? latitude;
  double? longitude;

  String? city;
  String? condition;
  String? humidity;
  String? temperature;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;

      notifyListeners();
    } catch (_) {
      throw Future.error(_.toString());
    }
  }

  Future<dynamic> getLocationWeather(String? state) async {
    late List<double> coordinates = OpenWeatherUtil.getCoordinates(state);
    late OpenWeatherHTTPHandler handler = OpenWeatherHTTPHandler(
      '$endpoint?lat=${coordinates[0]}&lon=${coordinates[1]}&appid=$apikey&units=metric',
    );

    dynamic data = await handler.getData();

    temperature = '${data['main']['temp']} °C';
    city = '${data['name']}';
    humidity = '${data['main']['humidity']}';
    condition = '${data['weather'][0]['main']}';

    notifyListeners();
  }
}
