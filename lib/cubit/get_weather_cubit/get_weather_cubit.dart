import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_weather_cubit/get_weather_state%20.dart';
import 'package:weatherapp/models/weatherModel.dart';
import 'package:weatherapp/service/weatheService.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getWeather({required cityName}) async {
    try {
      WeatherModel? weatherModel =
          await WeatheService(dio: Dio()).getCurrentWeather(cityName: cityName);

      emit(LodedWeatherState(weatherModel!));
    } catch (e) {
      emit(FailureWeatherState(e.toString()));
    }
  }
}
