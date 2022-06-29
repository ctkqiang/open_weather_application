import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_application/constant/open_weather_themes.dart';
import 'package:open_weather_application/interfaces/open_weather_util.dart';
import 'package:open_weather_application/translations/locale_keys.g.dart';
import 'package:open_weather_application/views/widgets/open_weather_textsyle.dart';

class OpenWeatherMain extends StatefulWidget {
  const OpenWeatherMain({Key? key}) : super(key: key);

  @override
  State<OpenWeatherMain> createState() => _OpenWeatherMainState();
}

class _OpenWeatherMainState extends State<OpenWeatherMain> {
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
                    color: OpenWeatherThemes.whiteAccent),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: OpenWeatherThemes.blackAccent,
      body: Center(
          child: Text(
        's',
        style: OpenWeatherTextsyle.defaultTextStyle(
          color: OpenWeatherThemes.primaryAccent,
        ),
      )),
    );
  }
}
