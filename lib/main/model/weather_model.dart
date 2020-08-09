import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherModel {
  String lat;
  String lon;

  WeatherModel({@required this.lat, @required this.lon});

  @override
  String toString() {
    return jsonEncode(this);
  }

  WeatherModel.fromString(String encodedModel) {
    Map<String, String> data = jsonDecode(encodedModel);
    this.lon = data['lon'];
    this.lat = data['lat'];
  }
}