import 'package:clima/views/views.dart';

class CurrentWeatherService {
  final HttpAPIService api = HttpAPIService();
  getWeather(String city) async {
    final response = await api
        .getAPI("${ApiUrls.currentWeatherAPI}&q=$city&days=5&aqi=no&alerts=no");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    }
  }
}
