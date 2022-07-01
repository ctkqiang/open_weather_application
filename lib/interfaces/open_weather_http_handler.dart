import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenWeatherHTTPHandler {
  final String? url;

  OpenWeatherHTTPHandler(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url!));

    if (response.statusCode != 200) throw response.statusCode;

    return jsonDecode(response.body);
  }
}
