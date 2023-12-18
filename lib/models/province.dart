part of 'models.dart';

class Province extends Equatable {
  final String? provinceId;
  final String? province;

  const Province({this.provinceId, this.province});

  // Factory method to create a Province object from a map
  factory Province.fromMap(Map<String, dynamic> data) {
    return Province(
      provinceId: data['province_id'] as String?,
      province: data['province'] as String?,
    );
  }

  // Factory method to create a Province object from JSON
  factory Province.fromJson(String jsonStr) => Province.fromMap(json.decode(jsonStr) as Map<String, dynamic>);

  // Convert Province object to a map
  Map<String, dynamic> toMap() => {
        'province_id': provinceId,
        'province': province,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [provinceId, province];
}
