import 'package:citylist/components/constants.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final double width;
  final double height;

  const Progress({this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
