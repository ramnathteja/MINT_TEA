import 'package:flutter/material.dart';

class ParkingLot2A extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //1A
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            SizedBox(
              width: 40.0,
            ),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
          ],
        ),
        SizedBox(height: 15.0,),
        Row(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            SizedBox(
              width: 60.0,
            ),
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
          ],
        ),
      ],
    );
  }
}
