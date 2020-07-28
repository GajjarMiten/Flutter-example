import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:indian_cities/database/fav_cities.dart';
import 'package:indian_cities/model/city_model.dart';
import 'package:indian_cities/services/api_service.dart';
import 'package:indian_cities/view_model/CityInfo.dart';

class AllCities extends StatefulWidget {
  @override
  _AllCitiesState createState() => _AllCitiesState();
}

class _AllCitiesState extends State<AllCities>
    with AutomaticKeepAliveClientMixin {
  ApiService get service => GetIt.I<ApiService>();
  AppDB get db => GetIt.I<AppDB>();

  static var cities;

  String query;

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    service.getCities().then((value) {
      setState(() {
        cities = value.body;
      });
    }).catchError((e, c) {
      print("There might be some issue in AllCityPage $e $c");
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (cities == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: <Widget>[
        ListView.builder(
          addAutomaticKeepAlives: true,
          itemCount: (cities.isNotEmpty) ? cities.length : 1,
          itemBuilder: (context, index) {
            if (cities.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Text(
                    "Sorry no entry found",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              );
            }
            final model = CityModel.fromJson(cities[index]);

            return buildSlidable(model);
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      setState(() {
                        query = value;
                        cities = null;
                      });
                      service.getCity(query).then((value) {
                        setState(() {
                          cities = value.body;
                          print(cities);
                        });
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Search city",
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: "clear search",
                  icon: Icon(
                    Icons.clear,
                    size: 35,
                  ),
                  onPressed: () {
                    controller.clear();
                    FocusScope.of(context).unfocus();
                    fetchData();
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSlidable(CityModel model) {
    return Slidable(
      enabled: true,
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: "Add to fav.",
          color: Colors.green,
          icon: Icons.add,
          onTap: () async {
            // id is auto incremented at moord
            // ignore: missing_required_param
            final CityData entry = CityData(
              city: model.city,
              state: model.state,
              district: model.district,
            );
            var resutl = await db.intertCity(entry);
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("${entry.city} has been added to favourite")));
            print(resutl);
          },
        ),
      ],
      child: CityInfo(model),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
