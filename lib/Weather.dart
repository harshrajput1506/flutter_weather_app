import 'dart:ffi';

class Weather {
  late String location;
  late String country;
  late String tempC;
  late String tempF;
  late String localtime;
  late String lastUpdated;
  late bool isDay;
  late String condition;
  late String conditionIcon;
  late double windSpeed;
  late int uv;
  late int humidity;
  late String feelsLikeC;
  late String feelsLikeF;
  late double precip;

  Weather.fromJson(Map<String, dynamic> response) {

    location = response["location"]["name"];
    country = response["location"]["country"];
    localtime = response["location"]["localtime"];
    lastUpdated = response["current"]["last_updated"];
    tempC = response["current"]["temp_c"];
    tempF = response["current"]["temp_f"];
    isDay = response["current"]["is_day"] == 1 ? true : false;
    condition = response["current"]["condition"]["text"];
    conditionIcon = response["current"]["condition"]["icon"];
    windSpeed = response["current"]["wind_kph"];
    uv = response["current"]["uv"];
    feelsLikeC = response["current"]["feelslike_c"];
    feelsLikeF = response["current"]["feelslike_f"];
    humidity = response["current"]["humidity"];
  }

}