import 'package:flutter/cupertino.dart';
import 'package:weather_app/Weather.dart';
import 'package:weather_app/WeatherService.dart';

class WeatherProvider with ChangeNotifier {
  late Weather? _weather;
  final WeatherService _weatherService = WeatherService();
  bool _isLoading = false;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather(double lat, double lon) async {
    _isLoading = false;
    notifyListeners();

    try {
      final weatherResponse = await _weatherService.fetchWeather(lat, lon);
      _weather = Weather.fromJson(weatherResponse);
      _isLoading = false;
      notifyListeners();
    }
    catch(e) {
      throw Exception('Failed to get weather data from json');
    }

  }

}