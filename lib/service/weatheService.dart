import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weatherModel.dart';

class WeatheService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String key = 'f7e694496d5a40beb1c205423242607';

  WeatheService({required this.dio});

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$key&q=$cityName&days=10');

      print(response.data);

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops try again';
      throw errorMessage;
    } catch (e) {
      log(e.toString());
      throw Exception;
    }
  }
}
