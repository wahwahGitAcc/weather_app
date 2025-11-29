


import '../data/models/search_city_model.dart';

sealed class SearchCityState{}

class SearchCityLoading extends SearchCityState{}


class SearchCityFormState extends SearchCityState{}

class SearchCitySuccess extends SearchCityState{
  final SearchCityModel cityModel;
  SearchCitySuccess({required this.cityModel});
}

class SearchCityFailed extends SearchCityState{
  final String errorMessage;
  SearchCityFailed({required this.errorMessage});
}



