import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
class WeatherServices{
  String baseUrl="http://api.weatherapi.com/v1";
  String apiKey="75be4f1d6ed7420f9ad222027221612";
  Future<WeatherModel> getWeather({required String cityName})
  async{
    Uri url=Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
   http.Response response=  await http.get(url);

   Map<String,dynamic> data=jsonDecode(response.body);

    WeatherModel weather=WeatherModel.fromJson(data);
    return weather;

  }
}