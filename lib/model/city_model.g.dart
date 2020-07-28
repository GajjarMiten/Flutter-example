// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return CityModel(
    city: json['City'] as String,
    state: json['State'] as String,
    district: json['District'] as String,
  );
}

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'City': instance.city,
      'State': instance.state,
      'District': instance.district,
    };
