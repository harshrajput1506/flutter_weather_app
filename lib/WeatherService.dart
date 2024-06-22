import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String API_KEY = "";
  final String BASE_URL = "https://api.weatherapi.com/v1/current.json";

  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    Uri url = Uri.parse('$BASE_URL?q=$lat%2C$lon&key=$API_KEY');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}