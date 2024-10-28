import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_state%20.dart';
import 'package:weatherapp/widget/infoWeather.dart';
import 'package:weatherapp/widget/noWeather.dart';
import 'package:weatherapp/widget/searchView.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return noWeather();
          } else if (state is LodedWeatherState) {
            return InfoWeather(weatherModel: state.weatherModel);
          } else {
            return const Text('there was an error');
          }
        },
      ),
    );
  }
}
