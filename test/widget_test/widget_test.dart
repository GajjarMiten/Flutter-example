import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:indian_cities/HomePage.dart';
import 'package:indian_cities/database/fav_cities.dart';
import 'package:indian_cities/main.dart';
import 'package:indian_cities/services/api_service.dart';

void setupLocator() {
  GetIt.I.registerSingleton(ApiService.cretae());
  GetIt.I.registerSingleton(AppDB());
}

void main() {
  setupLocator();
  testWidgets("MyApp test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('HomePage test', (WidgetTester tester) async {
    final app = MaterialApp(
      home: HomePage(),
    );

    await tester.pumpWidget(app);

    expect(find.text('Indian Cities'), findsNWidgets(1));

    expect(find.byKey(Key('tabbar')), findsOneWidget);

    expect(find.byKey(Key('tabbarView')), findsOneWidget);
  });
}
