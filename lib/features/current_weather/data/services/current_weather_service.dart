import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

import '../../../../common/url_const.dart';
import '../models/current_weather_model.dart';


part 'current_weather_service.g.dart';

@RestApi(baseUrl: UrlConst.currentWeatherBaseUrl)
abstract class CurrentWeatherService {
  factory CurrentWeatherService(Dio dio) => _CurrentWeatherService(dio);
  @POST(UrlConst.forecast)
  Future<CurrentWeatherModel> currentWeather({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('appid') required String appId,
});
}