// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCityModel _$SearchCityModelFromJson(Map<String, dynamic> json) =>
    SearchCityModel(
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => CitySearchModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SearchCityModelToJson(SearchCityModel instance) =>
    <String, dynamic>{'results': instance.results};

CitySearchModel _$CitySearchModelFromJson(Map<String, dynamic> json) =>
    CitySearchModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      country: json['country'] as String,
    );

Map<String, dynamic> _$CitySearchModelToJson(CitySearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
    };
