import 'package:flutter/material.dart';
import 'package:indian_cities/model/city_model.dart';

class CityInfo extends StatefulWidget {
  final CityModel model;
  CityInfo(this.model);

  @override
  _CityInfoState createState() => _CityInfoState();
}

class _CityInfoState extends State<CityInfo> {
  static const gap = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(15),
      width: size.height - 80,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: Colors.black26,
              blurRadius: 10,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "City : ${widget.model.city}",
            style: TextStyle(fontSize: 18),
          ),
          gap,
          Text(
            "State : ${widget.model.state}",
            style: TextStyle(fontSize: 18),
          ),
          gap,
          Text(
            "district : ${widget.model.district}",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
