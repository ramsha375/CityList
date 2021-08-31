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
  bool loading = false;
  List<CityList> cities = [];
  @override
  void initState() {
    super.initState();
    fetchCities();
    // SubAreaList.getSubAreas("MA Jinnah Road").then((fetchedareas) {
    //   print(fetchedareas);
    // });
  }

  Future<List<CityList>> fetchCities() async {
    List<CityList> fetchCities = await CityList.getCities();
    setState(() {
      cities = fetchCities;
      loading = true;
    });
    return cities;
  }

  @override
  Widget build(BuildContext context) {
    return (loading)
        ? Expanded(
            child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (BuildContext context, int index) {
                  return CityCard(city: cities[index]);
                }))
        : Progress();
  }
}
