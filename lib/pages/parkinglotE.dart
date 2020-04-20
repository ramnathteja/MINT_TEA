import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';

import '../environment.dart';

class ParkingLotE extends StatefulWidget {
  @override
  _ParkingLotEState createState() => _ParkingLotEState();
}

class _ParkingLotEState extends State<ParkingLotE> {
  List<ParkingSpotModel> data = new List<ParkingSpotModel>();

  @override
  void initState() {
    super.initState();
    // print('init state was called');
    Timer.periodic(Environment.requestCyclePeriod, (timer) async {
      ParkingLotGroupData parkingData = new ParkingLotGroupData();
      List<ParkingSpotModel> _data = new List<ParkingSpotModel>();
      _data = await parkingData.getGroupData(Environment.lotE_URL);
      if (_data.isNotEmpty) {
        setState(() {
          data = _data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tempRowA = ParkingListWidget().getParkingLotList(128, 140, data);
    List<Widget> tempRowB = ParkingListWidget().getParkingLotList(132, 143, data);
    for(int i = 0; i < tempRowA.length; i++) {
      
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          //2A
          children: ParkingListWidget().getParkingLotList(128, 140, data),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: ParkingListWidget().getParkingLotList(132, 143, data),
        ),
      ],
    );
  }
}
