kill:
	- taskkill /f /im java.exe
	- taskkill /f /im dart.exe
	- taskkill /f /im adb.exe

test:
	- flutter test

run:
	- flutter run --verbose

get:
	- flutter pub run  easy_localization:generate -S "assets/translations" -O "lib/translations"
	- flutter pub run  easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys
	- flutter pub get

status:
	- curl https://storage.flutter-io.cn/

generate:
	- dart pub global run dcdg --output='class.plantuml' --verbose

clean:
	- flutter clean --verbose

connect: 
	- adb tcpip 5555
	- adb connect 192.168.14.170

set_icon:
	- flutter pub get
	- flutter pub run flutter_launcher_icons:main