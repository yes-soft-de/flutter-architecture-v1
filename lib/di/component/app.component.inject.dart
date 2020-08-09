import 'app.component.dart' as _i1;
import '../../main/repository/weather_repository.dart' as _i2;
import '../../main/manager/weather_manager.dart' as _i3;
import 'dart:async' as _i4;
import '../../main.dart' as _i5;
import '../../main/ui/screens/weather_screen/weather_screen.dart' as _i6;
import '../../main/state_manager/weather_statemanager.dart' as _i7;
import '../../main/service/weather_service.dart' as _i8;
import '../../presetance/shared_prefs/shared_prefs.dart' as _i9;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._();

  _i2.WeatherRepository _singletonWeatherRepository;

  _i3.WeatherManager _singletonWeatherManager;

  static _i4.Future<_i1.AppComponent> create() async {
    final injector = AppComponent$Injector._();

    return injector;
  }

  _i5.MyApp _createMyApp() => _i5.MyApp(_createWeatherScreen());
  _i6.WeatherScreen _createWeatherScreen() =>
      _i6.WeatherScreen(_createWeatherStateManager());
  _i7.WeatherStateManager _createWeatherStateManager() =>
      _i7.WeatherStateManager(_createWeatherService());
  _i8.WeatherService _createWeatherService() => _i8.WeatherService(
      _createSharedPreferencesHelper(), _createWeatherManager());
  _i9.SharedPreferencesHelper _createSharedPreferencesHelper() =>
      _i9.SharedPreferencesHelper();
  _i3.WeatherManager _createWeatherManager() => _singletonWeatherManager ??=
      _i3.WeatherManager(_createWeatherRepository());
  _i2.WeatherRepository _createWeatherRepository() =>
      _singletonWeatherRepository ??= _i2.WeatherRepository();
  @override
  _i5.MyApp get app => _createMyApp();
}
