import 'dart:convert';

import 'package:http/http.dart';
import 'package:inject/inject.dart';
import 'package:paterns_app_2/api_routes.dart';
import 'package:paterns_app_2/main/response/weather_response.dart';

@provide
@singleton
class WeatherRepository {
  Client _httpClient;

  WeatherRepository() {
    _httpClient = new Client();
  }

  Future<WeatherResponse> getWeather() async {
    Response response = await _httpClient.get(ApiRoutes.BASE_URL);

    if (response.statusCode >= 200 && response.statusCode < 400) {
      return WeatherResponse.fromJson(jsonDecode(response.body));
    } else
      return null;
  }
}
