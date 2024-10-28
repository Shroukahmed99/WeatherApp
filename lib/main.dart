import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_state%20.dart';
import 'package:weatherapp/weather_home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  MaterialColor currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocListener<GetWeatherCubit, GetWeatherState>(
        listener: (context, state) {
          if (state is LodedWeatherState) {
            setState(() {
              currentColor = getColorCondation(state.weatherModel.condition);
            });
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            primarySwatch: currentColor,
            appBarTheme: AppBarTheme(
              color: currentColor,
            ),
          ),
          home: const WeatherHomePage(),
        ),
      ),
    );
  }
}

MaterialColor getColorCondation(String? condition) {
  if (condition == null) {
    return Colors.cyan;
  }
  switch (condition.toLowerCase()) {
    case 'clear':
      return Colors.blue;
    case 'sunny':
      return Colors.orange;
    case 'moderate rain':
      return Colors.blue;
    case 'patchy rain nearby':
      return Colors.blueGrey;
    case 'cloudy':
      return Colors.blueGrey;

    case 'fog':
      return Colors.grey;
    case 'storm':
      return Colors.deepPurple;
    case 'hail':
      return Colors.cyan;
    case 'windy':
      return Colors.teal;
    case 'dust':
      return Colors.brown;
    case 'overcast':
      return Colors.grey;

    default:
      return Colors.blue;
  }
}
