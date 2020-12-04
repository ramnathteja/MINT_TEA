import 'package:flutter/material.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:provider/provider.dart';

import '../environment.dart';

class ParkingLotB extends StatefulWidget {
  @override
  _ParkingLotBState createState() => _ParkingLotBState();
}

class _ParkingLotBState extends State<ParkingLotB> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceB;
    return Container(
      child: (data == null)
          ? Loading()
          : Row(
              children: <Widget>[
                Column(
                  children: [
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(199, 206, 1.6, data),
                    ),
                    SizedBox(
                      height: 2 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(210, 211, 1.6, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: 3 * Environment.minMeasurement,
                ),
                Column(
                  children: [
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(191, 198, 1.6, data),
                    ),
                    SizedBox(
                      height: Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(207, 209, 1.6, data),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
