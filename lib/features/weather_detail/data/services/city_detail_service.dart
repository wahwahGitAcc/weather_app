import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

import '../../../../common/url_const.dart';
import '../models/city_detail_model.dart';


part 'city_detail_service.g.dart';

@RestApi(baseUrl: UrlConst.cityDetailBaseUrl)
abstract class CityDetailService {
  factory CityDetailService(Dio dio) => _CityDetailService(dio);
  @POST(UrlConst.weather)
  Future<CityDetailModel> cityDetail({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('appid') required String appId,
});
}


