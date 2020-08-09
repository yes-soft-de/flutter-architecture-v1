import 'package:inject/inject.dart';
import 'package:paterns_app_2/main/repository/weather_repository.dart';
import 'package:paterns_app_2/main/response/weather_response.dart';

@provide
@singleton
class WeatherManager {
  WeatherRepository _repository;

  WeatherManager(this._repository);

  Future<WeatherResponse> getWeather() {
    return _repository.getWeather();
  }
}