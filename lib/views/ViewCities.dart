import 'package:citylist/components/constants.dart';
import 'package:citylist/views/AllCities.dart';
import 'package:flutter/material.dart';

class ViewCities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.fromLTRB(0, kDefaultPadding, 0, kDefaultPadding),
        child: AllCities(),
      ),
    );
  }
}
