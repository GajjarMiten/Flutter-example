import 'package:flutter_driver/flutter_driver.dart';

import 'package:test/test.dart';

void main() {
  group('main app', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect(timeout: Duration(seconds: 10));
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('health test', () async {
      Health health = await driver.checkHealth();
      print(health);
    });
  });
}
