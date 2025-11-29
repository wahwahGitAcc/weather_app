import 'package:json_annotation/json_annotation.dart';
part 'search_city_model.g.dart';

@JsonSerializable()
class SearchCityModel {
  final List<CitySearchModel>? results;

  SearchCityModel({required this.results});
  factory SearchCityModel.fromJson(Map<String, dynamic> json) =>
      _$SearchCityModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchCityModelToJson(this);
}

@JsonSerializable()
class CitySearchModel {
  final int? id;
  final String name;
  final double latitude;
  final double longitude;
  final String country;

  CitySearchModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory CitySearchModel.fromJson(Map<String, dynamic> json) =>
      _$CitySearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$CitySearchModelToJson(this);
}
