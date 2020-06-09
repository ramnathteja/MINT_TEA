import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';
import 'package:mint_tea/size_config.dart';

import '../environment.dart';

class ParkingLotC extends StatefulWidget {
  @override
  _ParkingLotCState createState() => _ParkingLotCState();
}

class _ParkingLotCState extends State<ParkingLotC> {
  List<ParkingSpotModel> data = new List<ParkingSpotModel>();

  @override
  void initState() {
    super.initState();
    // print('init state was called');
    Timer.periodic(Environment.requestCyclePeriod, (timer) async {
      ParkingLotGroupData parkingData = new ParkingLotGroupData();
      List<ParkingSpotModel> _data = new List<ParkingSpotModel>();
      _data = await parkingData.getGroupData(Environment.lotC_URL);
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
    temp.addAll(ParkingListWidget().getParkingLotList(186, 187, data));
    //TODO: transpose the row;
    temp.add(new SizedBox(
      width: SizeConfig.blockSizeHorizontal*5,
    ));
    temp.addAll(ParkingListWidget().getParkingLotList(185, 185, data));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //2A
          children: <Widget>[
            Column(
              children: ParkingListWidget().getParkingLotList(177, 184, data),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal*6,
            ),
            Column(
              children: ParkingListWidget().getParkingLotList(169, 176, data),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical*2, //60.0
        ),
        Row(
          children: temp,
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical*10, //100.0
        ),
        Row(
          children: ParkingListWidget().getParkingLotList(188, 195, data),
        ),
      ],
    );
  }
}
