import 'package:citylist/components/circularprogress.dart';
import 'package:citylist/components/constants.dart';
import 'package:citylist/models/locations.dart';
import 'package:flutter/material.dart';

class SubAreaCard extends StatefulWidget {
  final AreaAPI area;
  final List<SubAreaAPI> subarea;
  final Function updateSubareas;

  SubAreaCard({this.area, this.subarea, this.updateSubareas});

  @override
  _SubAreaCardState createState() => _SubAreaCardState();
}

class _SubAreaCardState extends State<SubAreaCard> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchSubAreas();
  }

  fetchSubAreas() async {
    if (widget.subarea == null) {
      List<SubAreaAPI> fetchSubAreas =
          await SubAreaAPI.getSubAreas(widget.area.name);
      widget.updateSubareas(fetchSubAreas);
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (loading)
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Progress(
                width: kwidth - 20,
                height: kheight - 20,
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.subarea
                .map((item) => Padding(
                      padding: const EdgeInsets.only(
                          left: kDefaultPadding, bottom: kDefaultPadding),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: cDefaultPadding,
                          ),
                          SizedBox(width: 40),
                          new Text('${item.name}'),
                        ],
                      ),
                    ))
                .toList());
  }
}
