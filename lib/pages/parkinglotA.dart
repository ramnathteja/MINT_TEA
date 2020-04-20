import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';

import '../environment.dart';

class ParkingLotA extends StatefulWidget {
  @override
  _ParkingLotAState createState() => _ParkingLotAState();
}

class _ParkingLotAState extends State<ParkingLotA> {
  List<ParkingSpotModel> data = new List<ParkingSpotModel>();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Environment.requestCyclePeriod, (timer) async {
      ParkingLotGroupData parkingData = new ParkingLotGroupData();
      List<ParkingSpotModel> _data = new List<ParkingSpotModel>();
      _data = await parkingData.getGroupData(Environment.lotA_URL);
      if (_data.isNotEmpty) {
        setState(() {
          data = _data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> temp = new List<Widget>();
    temp.add(new SizedBox(
      height: 40.0,
    ));
    temp.addAll(ParkingListWidget().getParkingLotList(233, 234, data));
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //1A
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(225, 232, data),
            ),
            SizedBox(
              width: 12.0,
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(217, 224, data),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(235, 236, data),
            ),
            SizedBox(
              width: 12.0,
            ),
            Column(
              children: temp,
            ),
          ],
        )
      ],
    );
  }
}
