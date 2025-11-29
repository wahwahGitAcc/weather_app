import '../data/models/city_detail_model.dart';

sealed class CityDetailState{}

class CityDetailLoading extends CityDetailState{}

class CityDetailSuccess extends CityDetailState{
  final CityDetailModel detailModel;
  CityDetailSuccess({required this.detailModel});
}

class CityDetailFailed extends CityDetailState{
  final String errorMessage;
  CityDetailFailed({required this.errorMessage});
}