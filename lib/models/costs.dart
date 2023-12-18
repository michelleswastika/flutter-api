part of 'models.dart';

class Cost extends Equatable {
  final String? service;
  final String? description;
  final List<CostInfo>? cost;

  const Cost({
    required this.service,
    required this.description,
    required this.cost,
  });

  factory Cost.fromMap(Map<String, dynamic> data) {
    return Cost(
      service: data['service'] as String?,
      description: data['description'] as String?,
      cost: (data['cost'] as List<dynamic>?)
          ?.map((e) => CostInfo.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'service': service,
        'description': description,
        'cost': cost?.map((e) => e.toMap()).toList(),
      };

  factory Cost.fromJson(String data) {
    try {
      final Map<String, dynamic> jsonData = json.decode(data) as Map<String, dynamic>;
      return Cost.fromMap(jsonData);
    } catch (e) {
      // Handle decoding error, for example by logging or throwing a specific exception.
      // You might want to return a default Cost object or rethrow the exception based on your use case.
      print('Error decoding Cost from JSON: $e');
      rethrow;
    }
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [service, description, cost];

  // Convenience method for handling JSON conversion
  static Cost? fromJsonString(String jsonString) {
    try {
      return Cost.fromMap(json.decode(jsonString) as Map<String, dynamic>);
    } catch (e) {
      // Handle decoding error and return null or throw an exception based on your use case.
      print('Error decoding Cost from JSON string: $e');
      return null;
    }
  }
}
