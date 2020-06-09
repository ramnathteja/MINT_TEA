import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';

import '../environment.dart';

class ParkingLotH extends StatefulWidget {
  @override
  _ParkingLotHState createState() => _ParkingLotHState();
}

class _ParkingLotHState extends State<ParkingLotH> {
  List<ParkingSpotModel> data = new List<ParkingSpotModel>();

  @override
  void initState() {
    super.initState();
    // print('init state was called');
    Timer.periodic(Environment.requestCyclePeriod, (timer) async {
      ParkingLotGroupData parkingData = new ParkingLotGroupData();
      List<ParkingSpotModel> _data = new List<ParkingSpotModel>();
      _data = await parkingData.getGroupData(Environment.lotH_URL);
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
      children: ParkingListWidget().getParkingLotList(95, 114, data),
    );
  }
}