import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';
import 'package:mint_tea/size_config.dart';

import '../environment.dart';

class ParkingLotG extends StatefulWidget {
  @override
  _ParkingLotGState createState() => _ParkingLotGState();
}

class _ParkingLotGState extends State<ParkingLotG> {
  List<ParkingSpotModel> data = new List<ParkingSpotModel>();

  @override
  void initState() {
    super.initState();
    // print('init state was called');
    Timer.periodic(Environment.requestCyclePeriod, (timer) async {
      ParkingLotGroupData parkingData = new ParkingLotGroupData();
      List<ParkingSpotModel> _data = new List<ParkingSpotModel>();
      _data = await parkingData.getGroupData(Environment.lotG_URL);
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          children: ParkingListWidget().getParkingLotList(81, 94, data),
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal*1,
        ),
        Column(
          children: ParkingListWidget().getParkingLotList(67, 80, data),
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal*2,
        ),
        Column(
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(58, 66, data),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical*4,
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(52, 57, data),
            ),
          ],
        ),
      ],
    );
  }
}