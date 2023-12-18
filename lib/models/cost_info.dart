import 'dart:convert';

class CostInfo {
  int? value;
  String? etd;
  String? note;

  CostInfo({this.value, this.etd, this.note});

  // Factory method to create a CostInfo object from a map
  factory CostInfo.fromMap(Map<String, dynamic> data) {
    return CostInfo(
      value: data['value'] as int?,
      etd: data['etd'] as String?,
      note: data['note'] as String?,
    );
  }

  // Convert CostInfo object to a map
  Map<String, dynamic> toMap() => {
        'value': value,
        'etd': etd,
        'note': note,
      }..removeWhere((key, value) => value == null);

  // Factory method to create a CostInfo object from JSON
  factory CostInfo.fromJson(String jsonStr) =>
      CostInfo.fromMap(json.decode(jsonStr) as Map<String, dynamic>);

  // Convert CostInfo object to a JSON string
  String toJson() => json.encode(toMap());
}