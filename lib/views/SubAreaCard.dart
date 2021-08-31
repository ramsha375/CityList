import 'package:citylist/components/constants.dart';
import 'package:citylist/models/locations.dart';
import 'package:flutter/material.dart';

class SubAreaCard extends StatefulWidget {
  final AreaList area;
  final List<SubAreaList> subarea;
  final Function updateSubareas;

  SubAreaCard({this.area, this.subarea, this.updateSubareas});

  @override
  _SubAreaCardState createState() => _SubAreaCardState();
}

class _SubAreaCardState extends State<SubAreaCard> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchSubAreas();
  }

  fetchSubAreas() async {
    if (widget.subarea == null) {
      List<SubAreaList> fetchSubAreas =
          await SubAreaList.getSubAreas(widget.area.name);
      widget.updateSubareas(fetchSubAreas);
      setState(() {
        loading = true;
      });
    } else {
      setState(() {
        loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.subarea);
    return (loading)
        ? Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.subarea
                    .map((item) => new Text('${item.name}'))
                    .toList()),
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: CircularProgressIndicator(
                strokeWidth: 4,
              ),
            ),
          );
  }
}
