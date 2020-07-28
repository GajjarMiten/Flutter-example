import 'package:indian_cities/database/fav_cities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  final String city;
  final String state;
  final String district;

  CityModel({this.city, this.state, this.district});

  factory CityModel.fromJson(Map<String, dynamic> data) =>
      _$CityModelFromJson(data);

  factory CityModel.fromClass(CityData data) {
    return CityModel(
      city: data.city,
      state: data.state,
      district: data.district,
    );
  }
}
