import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_project/common/url_const.dart';

import '../data/models/city_detail_model.dart';
import '../data/services/city_detail_service.dart';
import 'city_detail_state.dart';


class CityDetailCubit extends Cubit<CityDetailState>{
  CityDetailCubit(): super(CityDetailLoading());
  final CityDetailService _service = GetIt.I.get();

  void cityDetail(double lat,double long) async {
    debugPrint("*************************${lat} ${long}");
    try{
      emit(CityDetailLoading());
      CityDetailModel detailModel = await _service.cityDetail(lat: lat, lon: long, appId: UrlConst.appId);
      emit(CityDetailSuccess(detailModel: detailModel));
    }catch (e){
      debugPrint("EEEEE $e");
      emit(CityDetailFailed(errorMessage: "Failed To Load"));
    }
  }
}