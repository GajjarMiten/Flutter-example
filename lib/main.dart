import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:indian_cities/database/fav_cities.dart';

import 'HomePage.dart';
import 'services/api_service.dart';

void setupLocator() {
  GetIt.I.registerSingleton(ApiService.cretae());
  GetIt.I.registerSingleton(AppDB());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indian Cities',
      home: HomePage(),
    );
  }
}
