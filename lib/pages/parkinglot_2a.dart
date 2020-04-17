import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/pages/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';

class ParkingLot2A extends StatefulWidget {
  @override
  _ParkingLot2AState createState() => _ParkingLot2AState();
}

class _ParkingLot2AState extends State<ParkingLot2A> {
  final oneSec = Duration(seconds: 15);
  List<ParkingSpotModel> data = [];

  Future upDate() async {
    ParkingLotGroupData parkingData = new ParkingLotGroupData();
    await parkingData.getGroupData('http://125.138.177.86:7599/wdc_base/KETIParkingGroup8/fopt');
    setState(() {
      data = parkingData.groupData;
      // print('the state was a set');
    });
  }

  @override
  void initState() {
    super.initState();
    // print('init state was called');
   Timer.periodic(oneSec, (timer) async {
      await upDate();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //2A
          children: <Widget>[ 
            Column(
              children: ParkingListWidget().getParkingLotList(204, 211,data),
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(196, 203,data),
            ),
          ],
        ),
        SizedBox(height: 20.0,),
        Row(
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(215, 216,data),
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(212, 214,data),
            ),
          ],
        ),
      ],
    );
  }
}
