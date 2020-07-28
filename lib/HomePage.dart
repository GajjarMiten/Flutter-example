import 'package:flutter/material.dart';
import 'package:indian_cities/screens/all_cities_screen.dart';
import 'package:indian_cities/screens/fav_cities_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  String text = "waiting";

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Indian Cities',
          key: ValueKey('appbar title'),
        ),
        bottom: TabBar(
          key: Key('tabbar'),
          controller: controller,
          tabs: [
            Text("All Cities"),
            Text("Fav. Cities"),
          ],
        ),
      ),
      body: TabBarView(
        key: Key('tabbarView'),
        controller: controller,
        children: [
          AllCities(),
          FavCities(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
