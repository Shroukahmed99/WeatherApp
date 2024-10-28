import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weatherModel.dart';

class InfoWeather extends StatelessWidget {
  const InfoWeather({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColorCondation(weatherModel.condition),
            getColorCondation(weatherModel.condition)[300]!,
            getColorCondation(weatherModel.condition)[50]!
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              children: [
                Image.network(
                  "https:${weatherModel.image}",
                  height: 50,
                  width: 50,
                ),
                const Spacer(flex: 1),
                Text(
                  '${weatherModel.temp.round()}',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Spacer(flex: 1),
                Column(
                  children: [
                    Text(
                      'Max Temp: ${weatherModel.maxTemp.round()}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Min Temp: ${weatherModel.minTemp.round()}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Text(
            '${weatherModel.condition}',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
