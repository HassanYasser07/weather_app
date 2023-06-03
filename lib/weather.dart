import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/SearchPage.dart';
import 'package:weather_app/provider/weather_provider.dart';


import 'models/weather_model.dart';

class WeatherApp extends StatefulWidget {
   WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  void updateUi(){
    setState(() {

    });
}

WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()
          {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SearchPage(updateUi:updateUi);
          }));
          }, icon: Icon(Icons.search))
        ],
        title: Text("Weather App"),
      ),
      body: weatherData==null
          ?Center(
        child: Container(

          child: Column(

            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                style:TextStyle(
                  fontSize: 25
                ),
                  "There is no weather 😔 🤷 start searching now 🔎"
              )
            ],
          ),
        ),
      ):Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[100]!,

          ],
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
           const Spacer(flex: 3,),

            Text(Provider.of<WeatherProvider>(context).cityName!,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            Text("updated at ${weatherData!.date.toString()} 11:30 PM",style: TextStyle(fontSize: 22), ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image.asset(weatherData!.getImage(),),
                Text("${weatherData!.temp.toInt().toString()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Column(
                  children: [
                    Text("Max temp=${weatherData!.maxTemp.toInt() } "),
                    Text("Min temp=${weatherData!.minTemp.toInt()}"),
                  ],
                ),

              ],
            ),Spacer(),
            Text(weatherData!.weatherStateName,
              style:
              TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
           const Spacer(flex: 5,),

          ],
        ),
      ),
    );
  }
}
