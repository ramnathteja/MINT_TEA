import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';
import 'package:mint_tea/size_config.dart';

import '../environment.dart';

class ParkingLotF extends StatefulWidget {
  @override
  _ParkingLotFState createState() => _ParkingLotFState();
}

class _ParkingLotFState extends State<ParkingLotF> {
  List<ParkingSpotModel> data = new List<ParkingSpotModel>();

  @override
  void initState() {
    super.initState();
    // print('init state was called');
    Timer.periodic(Environment.requestCyclePeriod, (timer) async {
      ParkingLotGroupData parkingData = new ParkingLotGroupData();
      List<ParkingSpotModel> _data = new List<ParkingSpotModel>();
      _data = await parkingData.getGroupData(Environment.lotF_URL);
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
              children: <Widget>[
                Column(
                  children: ParkingListWidget().getParkingLotList(46, 51, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*8.5,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(44, 45, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(42, 43, data),
                ),
              ]
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal*4,
            ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  children: ParkingListWidget().getParkingLotList(39, 41, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(33, 38, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(31, 32, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(29, 30, data),
                ),
              ],
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal*1,
            ),
            Column(
              children: <Widget>[
                Column(
                  children: ParkingListWidget().getParkingLotList(26, 28, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(20, 25, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(18, 19, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(16, 17, data),
                ),
              ],
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal*2,
            ),
            Column(
              children: <Widget>[
                Column(
                  children: ParkingListWidget().getParkingLotList(13, 15, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(7, 12, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(5, 6, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(3, 4, data),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical*1,
                ),
                Column(
                  children: ParkingListWidget().getParkingLotList(1, 2, data),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
