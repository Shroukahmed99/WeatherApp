import 'package:weatherapp/models/weatherModel.dart';

class GetWeatherState {}

class NoWeatherState extends GetWeatherState {}

class LodedWeatherState extends GetWeatherState {
  final WeatherModel weatherModel;

  LodedWeatherState(this.weatherModel);
}

class FailureWeatherState extends GetWeatherState {
  final String errorMessage;

  FailureWeatherState(this.errorMessage);
}

class InfoWeatherState extends GetWeatherState {}
