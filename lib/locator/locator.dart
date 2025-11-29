import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/current_weather/data/services/current_weather_service.dart';
import '../features/search_city/data/services/search_city_service.dart';
import '../features/weather_detail/data/services/city_detail_service.dart';



Future<void> setUpLocator() async {
  GetIt getIt = GetIt.I;
  Dio dio = Dio();

  getIt.registerSingleton(SearchCityService(dio));
  getIt.registerSingleton(CityDetailService(dio));
  getIt.registerSingleton(CurrentWeatherService(dio));
}
