import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../common/url_const.dart';
import '../data/models/current_weather_model.dart';
import '../data/services/current_weather_service.dart';
import 'current_weather_state.dart';


class CurrentWeatherCubit extends Cubit<CurrentWeatherState>{
  CurrentWeatherCubit(): super(CurrentWeatherLoading());
  final CurrentWeatherService _service = GetIt.I.get();

  void currentWeather({required double lat, required double lon}) async{
    try {
      emit(CurrentWeatherLoading());
      CurrentWeatherModel currentModel = await _service.currentWeather(lat: lat, lon: lon, appId: UrlConst.appId);
      emit(CurrentWeatherSuccess(currentModel: currentModel));
      debugPrint("Current Data ********* ${currentModel.list[0].dt}");
    } catch (e) {
      emit(CurrentWeatherFailed(errorMessage: "Failed To Load"));
    }
  }


}