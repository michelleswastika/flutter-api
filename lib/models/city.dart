part of 'models.dart';

class City extends Equatable {
  final String? cityId;
  final String? provinceId;
  final String? province;
  final String? type;
  final String? cityName;
  final String? postalCode;

  const City({
    this.cityId,
    this.provinceId,
    this.province,
    this.type,
    this.cityName,
    this.postalCode,
  });

  factory City.fromMap(Map<String, dynamic> data) {
    return City(
      cityId: data['city_id'] as String?,
      provinceId: data['province_id'] as String?,
      province: data['province'] as String?,
      type: data['type'] as String?,
      cityName: data['city_name'] as String?,
      postalCode: data['postal_code'] as String?,
    );
  }

  // Named constructor for creating City object from JSON
  factory City.fromJson(String jsonStr) => City.fromMap(json.decode(jsonStr) as Map<String, dynamic>);

  // Convert City object to a map
  Map<String, dynamic> toMap() {
    return {
      'city_id': cityId,
      'province_id': provinceId,
      'province': province,
      'type': type,
      'city_name': cityName,
      'postal_code': postalCode,
    }..removeWhere((key, value) => value == null);
  }

  // Convert City object to a JSON string
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [cityId, provinceId, province, type, cityName, postalCode];
}