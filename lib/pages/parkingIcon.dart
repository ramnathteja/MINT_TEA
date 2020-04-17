import 'package:flutter/material.dart';

class ParkingIconCustom extends StatelessWidget {

  final String status;
  ParkingIconCustom({this.status});


  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.directions_car,
      color: (status=='free')?Colors.green:Colors.red
    );
  }
}