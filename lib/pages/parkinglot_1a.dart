import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/pages/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';

class ParkingLot1A extends StatefulWidget {
  @override
  _ParkingLot1AState createState() => _ParkingLot1AState();
}

class _ParkingLot1AState extends State<ParkingLot1A> {
  final oneSec = Duration(seconds: 15);
  List<ParkingSpotModel> data = [];

  Future upDate() async {
    ParkingLotGroupData parkingData = new ParkingLotGroupData();
    await parkingData.getGroupData('http://125.138.177.86:7599/wdc_base/KETIParkingGroupVisitor/fopt');
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
          //1A
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(225, 232, data),
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
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(235, 236, data),
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(233, 234, data),
            ),
          ],
        )
      ],
    );
  }
}
