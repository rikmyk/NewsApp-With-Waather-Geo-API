import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:berita/models/weather_model/weather_models.dart';

class WeatherService {
  final String apiKey =
      '22788c420b55d03d61eb2b794e2b4af4'; // Replace with your API key
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherData?> fetchWeather(double latitude, double longitude) async {
    final response = await http
        .get(Uri.parse('$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return WeatherData.fromJson(json);
    } else {
      return null;
    }
  }
}
