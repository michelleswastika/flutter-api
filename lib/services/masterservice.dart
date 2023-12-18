part of 'services.dart';

class MasterDataService {
  static final String _baseUrl = '${Const.baseUrl}/starter';
  static final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'key': Const.apiKey,
  };

  static Future<List<Province>> getProvince() async {
    final response = await http.get(Uri.parse('$_baseUrl/province'), headers: _headers);

    return _parseResults<Province>(response, 'rajaongkir');
  }

  static Future<List<City>> getCityByProvince(String provinceId) async {
    final queryParameters = {'province': provinceId};
    final response = await http.get(Uri.https('api.rajaongkir.com', '/starter/city', queryParameters), headers: _headers);

    return _parseResults<City>(response, 'rajaongkir');
  }

  static Future<List<CostResult>> getCosts(String origin, String destination, String weight, String courier) async {
    print('Request');
    final body = {
      'origin': origin,
      'destination': destination,
      'weight': weight,
      'courier': courier,
    };

    final response = await http.post(Uri.https('api.rajaongkir.com', '/starter/cost'), headers: _headers, body: jsonEncode(body));

    return _parseResults<CostResult>(response, 'rajaongkir');
  }

  static List<T> _parseResults<T>(http.Response response, String key) {
    if (response.statusCode == 200) {
      final job = json.decode(response.body);
      return (job[key]['results'] as List).map((e) => _createObject<T>(e)).toList();
    } else {
      return [];
    }
  }

  static T _createObject<T>(Map<String, dynamic> data) {
    switch (T) {
      case Province:
        return Province.fromMap(data) as T;
      case City:
        return City.fromMap(data) as T;
      case CostResult:
        return CostResult.fromMap(data) as T;
      default:
        throw ArgumentError("Unsupported type: $T");
    }
  }
}
