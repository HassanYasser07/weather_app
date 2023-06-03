import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';


class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});
  VoidCallback? updateUi;

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search a City"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data)
           async {
               cityName=data;
               WeatherServices service= WeatherServices();
               WeatherModel weather=
               await service.getWeather(cityName: cityName!);
               Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
               Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              labelText: "Searsh",
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: "Enter a city"
            ),
          ),
        ),
      ) ,
    );
  }
}
