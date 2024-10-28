class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String image;
  final String condition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.image,
    required this.condition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'].toDouble(),
      minTemp:
          json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
      maxTemp:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
