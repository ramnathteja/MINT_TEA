import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';

import '../environment.dart';

class ParkingLotD extends StatefulWidget {
  @override
  _ParkingLotDState createState() => _ParkingLotDState();
}

class _ParkingLotDState extends State<ParkingLotD> {
List<ParkingSpotModel> data = new List<ParkingSpotModel>();

  @override
  void initState() {
    super.initState();
    // print('init state was called');
    Timer.periodic(Environment.requestCyclePeriod, (timer) async {
      ParkingLotGroupData parkingData = new ParkingLotGroupData();
      List<ParkingSpotModel> _data = new List<ParkingSpotModel>();
      _data = await parkingData.getGroupData(Environment.lotD_URL);
      if (_data.isNotEmpty) {
        setState(() {
          data = _data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //2A
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(156, 163, data),
            ),
            SizedBox(
              height: 40.0,
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(164, 168, data),
            ),
          ],
        ),
        SizedBox(
          width: 35.0,
        ),
        Column(
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(144, 147, data),
            ),
            SizedBox(
              height: 40.0,
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(148, 155, data),
            ),
          ],
        ),
      ],
    );
  }
}
