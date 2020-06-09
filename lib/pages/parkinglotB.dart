import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';
import 'package:mint_tea/size_config.dart';

import '../environment.dart';

class ParkingLotB extends StatefulWidget {
  @override
  _ParkingLotBState createState() => _ParkingLotBState();
}

class _ParkingLotBState extends State<ParkingLotB> {
  List<ParkingSpotModel> data = new List<ParkingSpotModel>();

  @override
  void initState() {
    super.initState();
    // print('init state was called');
    Timer.periodic(Environment.requestCyclePeriod, (timer) async {
      ParkingLotGroupData parkingData = new ParkingLotGroupData();
      List<ParkingSpotModel> _data = new List<ParkingSpotModel>();
      _data = await parkingData.getGroupData(Environment.lotB_URL);
      if (_data.isNotEmpty) {
        setState(() {
          data = _data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //2A
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(204, 211, data),
            ),
             SizedBox(
              width: SizeConfig.blockSizeHorizontal*1,
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(196, 203, data),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical*1.5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(215, 216, data),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal*0.7,
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(212, 214, data),
            ),
          ],
        ),
      ],
    );
  }
}
