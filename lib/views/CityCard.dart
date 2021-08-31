import 'package:citylist/components/constants.dart';
import 'package:citylist/models/locations.dart';
import 'package:citylist/views/Areas.dart';
import 'package:flutter/material.dart';

class CityCard extends StatefulWidget {
  final CityAPI city;
  CityCard({this.city});

  @override
  _CityCardState createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, 0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Area(widget.city)));
          },
          title: Text(widget.city.name),
        ),
      ),
    );
  }
}
