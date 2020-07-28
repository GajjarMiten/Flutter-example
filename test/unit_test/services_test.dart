import 'package:flutter_test/flutter_test.dart';
import 'package:indian_cities/services/api_service.dart';

void main() {
  group('API test', () {
    test("test getCities()", () async {
      final api = ApiService.cretae();
      final response = await api.getCities();
      expect(response.body.length, greaterThan(50));
    });

    test("test getCity() with valid query", () async {
      final api = ApiService.cretae();
      final response = await api.getCity('mumb');
      expect(response.body.length, greaterThan(0));

      for (int i = 0; i < response.body.length; i++) {
        expect(response.body[i]["City"], isNotNull);
        expect(response.body[i]["City"], isNotEmpty);
      }
    });

    test("test getCity() with empty query", () async {
      final api = ApiService.cretae();
      final response = await api.getCity('');
      expect(response.body.length, greaterThan(50));
    });

    test("test getCity() with invalid query", () async {
      final api = ApiService.cretae();
      final response = await api.getCity('shdgdghsaf');
      expect(response.body.length, 0);
    });
  });
}
