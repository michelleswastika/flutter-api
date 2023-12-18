part of 'models.dart';

class CostResult extends Equatable {
  final String? code;
  final String? name;
  final List<Cost>? costs;

  const CostResult({this.code, this.name, this.costs});

  // Factory method to create a CostResult object from a map
  factory CostResult.fromMap(Map<String, dynamic> data) {
    return CostResult(
      code: data['code'] as String?,
      name: data['name'] as String?,
      costs: (data['costs'] as List<dynamic>?)
          ?.map((e) => Cost.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // Convert CostResult object to a map
  Map<String, dynamic> toMap() {
    final cleanedMap = {
      'code': code,
      'name': name,
      'costs': costs?.map((e) => e.toMap()).toList(),
    };

    // Remove null or empty values from the map
    cleanedMap.removeWhere((key, value) => value == null || (value is List && value.isEmpty));

    return cleanedMap;
  }

  // Factory method to create a CostResult object from JSON
  factory CostResult.fromJson(String jsonStr) =>
      CostResult.fromMap(json.decode(jsonStr) as Map<String, dynamic>);

  // Convert CostResult object to a JSON string
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [code, name, costs];
}
