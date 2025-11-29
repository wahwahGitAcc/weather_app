import '../data/models/current_weather_model.dart';

sealed class CurrentWeatherState{}

class CurrentWeatherLoading extends CurrentWeatherState{}

class CurrentWeatherSuccess extends CurrentWeatherState{
  final CurrentWeatherModel currentModel;
  CurrentWeatherSuccess({required this.currentModel});
}

class CurrentWeatherFailed extends CurrentWeatherState{
  final String errorMessage;
  CurrentWeatherFailed({required this.errorMessage});
}