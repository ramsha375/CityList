import 'package:citylist/components/circularprogress.dart';
import 'package:citylist/components/constants.dart';
import 'package:citylist/models/locations.dart';
import 'package:citylist/views/ExpandedAreas.dart';
import 'package:flutter/material.dart';

class Area extends StatefulWidget {
  final CityList city;
  Area(this.city);

  @override
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<Area> {
  bool loading = false;
  List<AreaList> areas = [];
  @override
  void initState() {
    super.initState();
    fetchAreas();
  }

  List<SubAreaList> subareas = [];
  Future<List<AreaList>> fetchAreas() async {
    List<AreaList> fetchAreas = await AreaList.getAreas(widget.city.name);

    setState(() {
      areas = fetchAreas;
      loading = true;
    });
    return areas;
  }

  updateSubareas(newSubareas, AreaList area) {
    print(newSubareas);
    print(area);
    print(area.subareas);
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
          ? Padding(
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
            )
          : Progress(),
    );
  }
}
