class WeatherResponse {
  String lat;
  String lon;

  WeatherResponse({this.lon, this.lat});

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    this.lon = json['lon'];
    this.lat = json['lat'];
  }
}