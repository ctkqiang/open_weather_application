import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_application/constant/open_weather_names.dart';
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
  Object? _selectedValue;
  String? _selectedState;

  bool? isOnline = false;

  @override
  void initState() {
    super.initState();

    OpenWeatherUtil.isOnline().then((_) {
      super.setState(() => isOnline = _);
    });
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
      backgroundColor: OpenWeatherThemes.whiteAccent,
      body: (isOnline!)
          ? ListView(
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Select State from the list below to see changes.',
                  ),
                ),
                const SizedBox(height: 50),
                PopupMenuButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  initialValue: _selectedValue ?? 0,
                  enabled: true,
                  elevation: 2,
                  enableFeedback: true,
                  tooltip: 'Select State',
                  itemBuilder: (context) {
                    return state.map((_) {
                      return PopupMenuItem(
                        value: _.value,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 5,
                        ),
                        onTap: () {
                          super.setState(() => _selectedValue = _.value);
                          super.setState(() => _selectedState = _.name);

                          super.setState(
                            () {
                              Future(() {
                                super
                                    .context
                                    .read<Weather>()
                                    .getLocationWeather(_selectedState);
                              });
                            },
                          );
                        },
                        child: Text(_.name!),
                      );
                    }).toList();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: ListTile(
                      title: Text(_selectedState ?? 'Select State'),
                      trailing: const Icon(Icons.arrow_drop_down_circle),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 65, right: 65),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location: ${_selectedState ?? 0}',
                        style: OpenWeatherTextsyle.defaultTextStyle(
                          color: OpenWeatherThemes.primaryAccent,
                          size: 18,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Current Temperature: ${super.context.watch<Weather>().temperature ?? 0}',
                        style: OpenWeatherTextsyle.defaultTextStyle(
                          color: OpenWeatherThemes.primaryAccent,
                          size: 18,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Current Humidity: ${super.context.watch<Weather>().humidity ?? 0}',
                        style: OpenWeatherTextsyle.defaultTextStyle(
                          color: OpenWeatherThemes.primaryAccent,
                          size: 18,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Current Condition: ${super.context.watch<Weather>().condition ?? 0}',
                        style: OpenWeatherTextsyle.defaultTextStyle(
                          color: OpenWeatherThemes.primaryAccent,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                'No Internet Connection',
                style: OpenWeatherTextsyle.defaultTextStyle(
                  color: OpenWeatherThemes.whiteAccent,
                  size: 18,
                ),
              ),
            ),
      floatingActionButton: const Text(
        'Written By John Melody Me, requested by Carsome',
      ),
    );
  }
}
