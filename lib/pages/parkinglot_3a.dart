import 'package:flutter/material.dart';

class ParkingLot3A extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //1A
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
              ],
            ),
            SizedBox(
              width: 150.0,
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  color: Colors.green,
                ),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
                Icon(Icons.directions_car),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
        Row(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_car),
            SizedBox(
              width: 120.0,
            ),
            Icon(Icons.directions_car),
          ],
        ),
        SizedBox(
          height: 120.0,
        ),
        Row(
          children: <Widget>[
            Transform.rotate(
              angle: 3.1415926535897932 / 2,
              child: Icon(Icons.directions_car),
            ),
            Transform.rotate(
              angle: 3.1415926535897932 / 2,
              child: Icon(Icons.directions_car),
            ),
            Transform.rotate(
              angle: 3.1415926535897932 / 2,
              child: Icon(Icons.directions_car),
            ),
            Transform.rotate(
              angle: 3.1415926535897932 / 2,
              child: Icon(Icons.directions_car),
            ),
            Transform.rotate(
              angle: 3.1415926535897932 / 2,
              child: Icon(Icons.directions_car),
            ),
            Transform.rotate(
              angle: 3.1415926535897932 / 2,
              child: Icon(Icons.directions_car),
            ),
            Transform.rotate(
              angle: 3.1415926535897932 / 2,
              child: Icon(Icons.directions_car),
            ),
            Transform.rotate(
              angle: 3.1415926535897932 / 2,
              child: Icon(Icons.directions_car),
            ),
          ],
        ),
      ],
    );
  }
}
