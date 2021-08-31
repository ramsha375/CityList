import 'package:citylist/components/constants.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: kheight,
        child: CircularProgressIndicator(
          strokeWidth: cDefaultPadding,
        ),
      ),
    );
  }
}
