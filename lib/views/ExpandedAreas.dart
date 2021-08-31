import 'package:citylist/components/constants.dart';
import 'package:citylist/models/locations.dart';
import 'package:citylist/views/SubAreaCard.dart';
import 'package:flutter/material.dart';

class ExpandedAreas extends StatefulWidget {
  final AreaAPI area;
  final List<SubAreaAPI> subarea;
  final Function updateSubareas;

  const ExpandedAreas({this.area, this.subarea, this.updateSubareas});

  @override
  _ExpandedAreasState createState() => _ExpandedAreasState();
}

class _ExpandedAreasState extends State<ExpandedAreas> {
  updateSubareas(newSub) {
    widget.updateSubareas(newSub);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(0, cDefaultPadding, 0, cDefaultPadding),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ExpansionTile(
          expandedAlignment: Alignment.topLeft,
          title: Text(widget.area.name),
          children: <Widget>[
            SubAreaCard(
                area: widget.area,
                subarea: widget.subarea,
                updateSubareas: updateSubareas),
          ],
        ),
      ),
    );
  }
}
