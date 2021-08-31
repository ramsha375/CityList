import 'package:citylist/components/circularprogress.dart';
import 'package:citylist/components/constants.dart';
import 'package:citylist/models/locations.dart';
import 'package:citylist/views/ExpandedAreas.dart';
import 'package:flutter/material.dart';

class Area extends StatefulWidget {
  final CityAPI city;
  Area(this.city);

  @override
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<Area> {
  bool loading = true;
  List<AreaAPI> areas = [];
  @override
  void initState() {
    super.initState();
    fetchAreas();
  }

  List<SubAreaAPI> subareas = [];
  Future<List<AreaAPI>> fetchAreas() async {
    List<AreaAPI> fetchAreas = await AreaAPI.getAreas(widget.city.name);

    setState(() {
      areas = fetchAreas;
      loading = false;
    });
    return areas;
  }

  updateSubareas(newSubareas, AreaAPI area) {
    area.subareas = newSubareas;
    setState(() {
      subareas = newSubareas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.city.name),
        ),
        body: (loading)
            ? Progress(
                width: kwidth,
                height: kheight,
              )
            : Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: ListView.builder(
                  itemCount: areas.length,
                  itemBuilder: (context, i) {
                    return ExpandedAreas(
                      area: areas[i],
                      subarea: areas[i].subareas,
                      updateSubareas: (newSubareas) {
                        updateSubareas(newSubareas, areas[i]);
                      },
                    );
                  },
                ),
              ));
  }
}
