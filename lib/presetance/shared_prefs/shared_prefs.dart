import 'package:inject/inject.dart';
import 'package:paterns_app_2/main/model/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@provide
class SharedPreferencesHelper {
  static const String _KEY_WEATHER = 'weather';

  Future<void> setWeather(WeatherModel weatherModel) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(_KEY_WEATHER, weatherModel.toString());
  }

  Future<WeatherModel> getWeather() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    WeatherModel model = new WeatherModel.fromString(_sharedPreferences.getString(_KEY_WEATHER));
    return model;
  }

}