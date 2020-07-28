import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:indian_cities/database/fav_cities.dart';
import 'package:indian_cities/model/city_model.dart';
import 'package:indian_cities/view_model/CityInfo.dart';

class FavCities extends StatefulWidget {
  @override
  _FavCitiesState createState() => _FavCitiesState();
}

class _FavCitiesState extends State<FavCities> {
  AppDB get db => GetIt.I<AppDB>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.watchAllCity(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Oops there might be some error : ${snapshot.error} yes",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            );
          } else {
            final cities = snapshot.data;
            return ListView.builder(
              itemCount: (cities.isNotEmpty) ? cities.length : 1,
              itemBuilder: (context, index) {
                if (cities.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Text(
                        "add your favourite city",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  );
                }
                final model = CityModel.fromClass(cities[index]);

                return CityInfo(model);
              },
            );
          }
        }
        print(snapshot.connectionState);
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
