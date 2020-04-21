import 'package:flutter/material.dart';

class WorkBuilding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
          color: Colors.red[600],
          width: 210.0,
          height: 48.0,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 30.0),
          color: Colors.red[600],
          height: 300.0,
          width: 48.0,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
          color: Colors.red[600],
          width: 200.0,
          height: 48.0,
        ),
      ],
    );
  }
}
