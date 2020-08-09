import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:paterns_app_2/main/ui/screens/weather_screen/weather_screen.dart';

import 'di/component/app.component.dart';

void main() async {
  final container = await AppComponent.create();
  runApp(container.app);
}

@provide
class MyApp extends StatelessWidget {

  final WeatherScreen _weatherScreen;

  MyApp(this._weatherScreen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _weatherScreen,
    );
  }
}
