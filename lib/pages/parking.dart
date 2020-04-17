import 'package:flutter/material.dart';
import 'package:mint_tea/pages/parkinglot_2a.dart';
import 'package:mint_tea/pages/parkinglot_3a.dart';
import 'parkinglot_1a.dart';

class Parking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Korea Electronic Technology Institute'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ParkingLot1A(),
              ParkingLot2A(),
              // ParkingLot3A(),
            ],
          ),
        ],
      ),
    );
  }
}
