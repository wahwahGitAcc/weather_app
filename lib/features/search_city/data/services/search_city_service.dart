import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import '../../../../common/url_const.dart';
import '../models/search_city_model.dart';
part 'search_city_service.g.dart';

@RestApi(baseUrl: UrlConst.searchCityBaseUrl)

abstract class SearchCityService {
  factory SearchCityService(Dio dio) => _SearchCityService(dio);
  @GET(UrlConst.search)
  Future<SearchCityModel>  searchCity({
     @Query('name') required String name,
     @Query('count') required int count,
});
}



