import 'package:inject/inject.dart';
import 'package:paterns_app_2/main/manager/weather_manager.dart';
import 'package:paterns_app_2/main/model/weather_model.dart';
import 'package:paterns_app_2/main/response/weather_response.dart';
import 'package:paterns_app_2/presetance/shared_prefs/shared_prefs.dart';

@provide
class WeatherService {

  WeatherManager _weatherManager;
  SharedPreferencesHelper _preferencesHelper;

  WeatherService(this._preferencesHelper, this._weatherManager);

  Future<WeatherModel> getWeather() async {
    WeatherModel dataFromLocal =  await _getWeatherFromLocal();

    if (dataFromLocal == null) {
      WeatherResponse dataFromNetwork = await _getWeatherFromNetwork();
      _preferencesHelper.setWeather(getWeatherModel(dataFromNetwork));
      return getWeatherModel(dataFromNetwork);
    } else {
      return dataFromLocal;
    }
  }

  getWeatherModel(WeatherResponse response) {
    return new WeatherModel(lat: response.lat, lon: response.lon);
  }

  Future<WeatherResponse> refreshWeather() {
    dynamic data = _getWeatherFromNetwork();
    _preferencesHelper.setWeather(data);
    return data;
  }

  Future<WeatherResponse> _getWeatherFromNetwork() {
    return _weatherManager.getWeather();
  }

  Future<WeatherModel> _getWeatherFromLocal() {
    return _preferencesHelper.getWeather();
  }
}