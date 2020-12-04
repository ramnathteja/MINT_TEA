import 'package:flutter/material.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:provider/provider.dart';

class ParkingLotE extends StatefulWidget {
  @override
  _ParkingLotEState createState() => _ParkingLotEState();
}

class _ParkingLotEState extends State<ParkingLotE> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceE;
    return Container(
      child: (data == null)
          ? Loading()
          : Column(
              children: [
                Row(
                  children: (ParkingListWidget()
                          .getParkingLotList(126, 133, 1.6, data))
                      .reversed
                      .toList(),
                ),
                Row(
                  children: (ParkingListWidget()
                          .getParkingLotList(134, 139, 1.6, data))
                      .reversed
                      .toList(),
                ),
              ],
            ),
    );
  }
}
