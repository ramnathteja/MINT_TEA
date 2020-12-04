import 'package:flutter/material.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:provider/provider.dart';

import '../environment.dart';

class ParkingLotD extends StatefulWidget {
  @override
  _ParkingLotDState createState() => _ParkingLotDState();
}

class _ParkingLotDState extends State<ParkingLotD> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceD;
    return Container(
      child: (data == null)
          ? Loading()
          : Row(
              children: [
                Column(
                  children: [
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(151, 158, 1.6, data),
                    ),
                    SizedBox(
                      height: Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(159, 163, 1.6, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: 3 * Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(140, 142, 1.6, data),
                    ),
                    SizedBox(
                      height: 3 * Environment.minMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(143, 150, 1.6, data),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
