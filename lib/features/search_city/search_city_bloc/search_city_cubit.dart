
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


import '../data/models/search_city_model.dart';
import '../data/services/search_city_service.dart';
import 'search_city_state.dart';

class SearchCityCubit extends Cubit<SearchCityState>{
  SearchCityCubit() : super(SearchCityFormState());
  final SearchCityService _service = GetIt.I.get();

  void searchCity(String name) async {
    try{
      emit(SearchCityLoading());
      SearchCityModel cityModel = await _service.searchCity(name: name, count: 10);
      emit(SearchCitySuccess(cityModel: cityModel));
    }catch (e){
      emit(SearchCityFailed(errorMessage: "Failed To Load"));
    }
  }
}



