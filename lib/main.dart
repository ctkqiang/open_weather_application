import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_weather_application/constant/open_weather_themes.dart';
import 'package:open_weather_application/model/open_weather.dart';
import 'package:open_weather_application/open_weather_runner.dart';
import 'package:open_weather_application/translations/codegen_loader.g.dart';
import 'package:open_weather_application/views/widgets/open_weather_textsyle.dart';

@OpenWeather('main', 'This runs the programme')
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    /// Initialise [Easy Localisation] service
    await EasyLocalization.ensureInitialized();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: OpenWeatherThemes.transparent,
        systemNavigationBarColor: OpenWeatherThemes.blackAccent,
      ),
    );

    runApp(
      EasyLocalization(
        saveLocale: true,
        useOnlyLangCode: true,
        supportedLocales: const [Locale('en')],
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('en'),
        path: 'assets/translations',
        child: OpenWeatherRunner(isdebugMode: false),
      ),
    );
  } catch (_) {
    /// Onstart [Error] Handling
    ErrorWidget.builder = (details) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: OpenWeatherThemes.errorAccent,
          body: Center(
            child: Text(
              details.exception.toString(),
              style: OpenWeatherTextsyle.defaultTextStyle(
                color: OpenWeatherThemes.whiteAccent,
              ),
            ),
          ),
        ),
      );
    };
  }
}
