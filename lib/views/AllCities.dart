import 'package:citylist/components/circularprogress.dart';
import 'package:citylist/components/constants.dart';
import 'package:citylist/models/locations.dart';
import 'package:citylist/views/CityCard.dart';
import 'package:flutter/material.dart';

class AllCities extends StatefulWidget {
  @override
  _AllCitiesState createState() => _AllCitiesState();
}

class _AllCitiesState extends State<AllCities> {
  bool loading = true;
  List<CityAPI> cities = [];
  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  Future<List<CityAPI>> fetchCities() async {
    List<CityAPI> fetchCities = await CityAPI.getCities();
    setState(() {
      cities = fetchCities;
      loading = false;
    });
    return cities;
  }

  @override
  Widget build(BuildContext context) {
    return (loading)
        ? Progress(
            width: kwidth,
            height: kheight,
          )
        : Expanded(
            child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (BuildContext context, int index) {
                  return CityCard(city: cities[index]);
                }));
  }
}
