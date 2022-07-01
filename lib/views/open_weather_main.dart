import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_application/constant/open_weather_themes.dart';
import 'package:open_weather_application/interfaces/open_weather_util.dart';
import 'package:open_weather_application/providers/weather.dart';
import 'package:open_weather_application/translations/locale_keys.g.dart';
import 'package:open_weather_application/views/widgets/open_weather_textsyle.dart';
import 'package:provider/provider.dart';

class OpenWeatherMain extends StatefulWidget {
  const OpenWeatherMain({Key? key}) : super(key: key);

  @override
  State<OpenWeatherMain> createState() => _OpenWeatherMainState();
}

class _OpenWeatherMainState extends State<OpenWeatherMain> {
  bool? isOnline = false;

  @override
  void initState() {
    super.initState();

    OpenWeatherUtil.isOnline().then((_) {
      super.setState(() => isOnline = _);
    });

    super.context.read<Weather>().getLocationWeather(
          latitude: 5.285153,
          logitude: 100.456238,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 80),
        child: AppBar(
          backgroundColor: OpenWeatherThemes.primaryAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          leading: const Text(''),
          title: Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Image.asset(
                  'assets/images/app.png',
                  color: OpenWeatherThemes.whiteAccent,
                  height: 50,
                  width: 50,
                ),
              ),
              Text(
                LocaleKeys.app_name.tr(),
                style: OpenWeatherTextsyle.defaultTextStyle(
                  color: OpenWeatherThemes.whiteAccent,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: OpenWeatherThemes.blackAccent,
      body: (isOnline!)
          ? Center(
              child: Text(
              '${super.context.watch<Weather>().temperature}\n${super.context.watch<Weather>().city}\n${super.context.watch<Weather>().humidity}\n${super.context.watch<Weather>().condition}',
              style: OpenWeatherTextsyle.defaultTextStyle(
                color: OpenWeatherThemes.primaryAccent,
                size: 18,
              ),
            ))
          : Center(
              child: Text(
                'No Internet Connection',
                style: OpenWeatherTextsyle.defaultTextStyle(
                  color: OpenWeatherThemes.whiteAccent,
                  size: 18,
                ),
              ),
            ),
    );
  }
}
