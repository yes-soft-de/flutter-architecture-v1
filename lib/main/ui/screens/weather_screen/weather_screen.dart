import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:paterns_app_2/main/state_manager/weather_statemanager.dart';

@provide
class WeatherScreen extends StatefulWidget {
  final WeatherStateManager _stateManager;

  WeatherScreen(this._stateManager);

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int currentState = WeatherStateManager.STATUS_CODE_INIT;
  dynamic weatherData;

  @override
  Widget build(BuildContext context) {
    widget._stateManager.stateSteam.listen((event) {
      currentState = event[WeatherStateManager.KEY_STATUS];

      if (currentState == WeatherStateManager.STATUS_CODE_LOAD_SUCCESS) {
        weatherData = event[WeatherStateManager.KEY_PAYLOAD];
      }

      setState(() {});
    });


    switch (currentState) {
      case WeatherStateManager.STATUS_CODE_INIT:
        _getWeather();
        return _drawLoadingScreen();
      case WeatherStateManager.STATUS_CODE_LOAD_SUCCESS:
        return _drawSuccessScreen();
      case WeatherStateManager.STATUS_CODE_REFRESHING:
        return _drawLoadingScreen();
      default:
        return _drawErrorScreen();
    }
  }

  void _getWeather() {
    widget._stateManager.getWeather();
  }

  void _refreshWeather() {
    widget._stateManager.refreshWeather();
  }

  Scaffold _drawSuccessScreen() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Welcome to Weather App'),
          Row(
            children: <Widget>[
              // TODO Add Lat
              Text('lat '),
              // TODO Add Lon
              Text('lon ')
            ],
          ),
          RaisedButton(
            onPressed: () {
              _refreshWeather();
            },
            child: Text('Refresh'),
          )
        ],
      ),
    );
  }

  Scaffold _drawErrorScreen() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Welcome to Weather App'),
          Text('Error'),
          RaisedButton(
            onPressed: () {
              _refreshWeather();
            },
            child: Text('Refresh'),
          )
        ],
      ),
    );
  }

  Scaffold _drawLoadingScreen() {
    return Scaffold(
      body: Center(
        child: Text('Loading'),
      ),
    );
  }
}
