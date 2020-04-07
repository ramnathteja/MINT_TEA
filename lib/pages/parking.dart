import 'package:flutter/material.dart';
import 'package:mint_tea/pages/parkinglot_2a.dart';
import 'package:mint_tea/pages/parkinglot_3a.dart';
import 'parkinglot_1a.dart';

class Parking extends StatefulWidget {
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ParkingLot3A(),
            Divider(
              color: Colors.red,
            ),
            SizedBox(height: 10.0,),
            ParkingLot2A(),
            SizedBox(height: 10.0,),
            Divider(
              color: Colors.red,
            ),
            ParkingLot1A(),
          ],
        ),
      ),
    );
  }
}

