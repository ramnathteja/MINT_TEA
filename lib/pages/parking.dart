import 'package:flutter/material.dart';
import 'package:mint_tea/environment.dart';
import 'package:mint_tea/pages/parkinglotA.dart';
import 'package:mint_tea/pages/parkinglotB.dart';
import 'package:mint_tea/pages/parkinglotC.dart';
import 'package:mint_tea/pages/parkinglotD.dart';
import 'package:mint_tea/pages/parkinglotE.dart';

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
              ParkingLotA(),
              SizedBox(
                width: Environment.spacing_BTW_Container,
              ),
              ParkingLotB(),
              SizedBox(
                width: Environment.spacing_BTW_Container,
              ),
              ParkingLotC(),
              SizedBox(
                width: Environment.spacing_BTW_Container,
              ),
              ParkingLotD(),
              SizedBox(
                width: Environment.spacing_BTW_Container,
              ),
              ParkingLotE(),
            ],
          ),
        ],
      ),
    );
  }
}
