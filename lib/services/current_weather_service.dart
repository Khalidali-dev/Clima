import 'dart:convert';

import 'package:clima/models/current_weather_model.dart';
import 'package:clima/services/services.dart';
import 'package:clima/views/views.dart';

class CurrentWeatherService {
  final HttpAPIService api = HttpAPIService();
  getCurrentWeather(String city) async {
    final response =
        await api.getAPI("${ApiUrls.currentWeatherAPI}&q=$city&aqi=yes");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CurrentWeatherModel.fromJson(json);
    }
  }
}
