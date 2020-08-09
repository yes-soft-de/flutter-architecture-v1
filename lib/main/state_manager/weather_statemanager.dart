import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';
import 'package:paterns_app_2/main/service/weather_service.dart';

@provide
class WeatherStateManager {
  static const int STATUS_CODE_INIT = -1;
  static const int STATUS_CODE_REFRESHING = 851;
  static const int STATUS_CODE_LOAD_SUCCESS = 861;
  static const int STATUS_CODE_LOAD_ERROR = 871;

  static const String KEY_STATUS = 'status';
  static const String KEY_PAYLOAD = 'payload';

  WeatherService _weatherService;

  WeatherStateManager(this._weatherService);

  PublishSubject<Map<String, dynamic>> _stateSubject = new PublishSubject();

  Stream<Map<String, dynamic>> get stateSteam => _stateSubject.stream;

  getWeather() {
    _stateSubject.add({KEY_STATUS: STATUS_CODE_REFRESHING});

    _weatherService.getWeather().then((weatherModel) {
      if (weatherModel == null) {
        _stateSubject.add({KEY_STATUS: STATUS_CODE_LOAD_ERROR});
      } else {
        _stateSubject.add(
            {KEY_STATUS: STATUS_CODE_LOAD_SUCCESS, KEY_PAYLOAD: weatherModel});
      }
    });
  }

  refreshWeather() {
    _stateSubject.add({KEY_STATUS: STATUS_CODE_REFRESHING});

    _weatherService.refreshWeather().then((weatherModel) {
      if (weatherModel == null) {
        _stateSubject.add({KEY_STATUS: STATUS_CODE_LOAD_ERROR});
      } else {
        _stateSubject.add(
            {KEY_STATUS: STATUS_CODE_LOAD_SUCCESS, KEY_PAYLOAD: weatherModel});
      }
    });
  }
}
