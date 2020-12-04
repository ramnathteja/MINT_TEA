import 'package:flutter/material.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:provider/provider.dart';
import 'package:mint_tea/services/parkingListWidget.dart';

import '../environment.dart';

class ParkingLotC extends StatefulWidget {
  @override
  _ParkingLotCState createState() => _ParkingLotCState();
}

class _ParkingLotCState extends State<ParkingLotC> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceC;
    return Container(
        child: (data == null)
            ? Loading()
            : Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: ParkingListWidget()
                            .getParkingLotList(172, 179, 1.6, data),
                      ),
                      SizedBox(
                        width: 2 * Environment.maxMeasurement,
                      ),
                      Column(
                        children: ParkingListWidget()
                            .getParkingLotList(164, 171, 1.6, data),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Environment.maxMeasurement,
                  ),
                  Row(
                    children: (ParkingListWidget()
                            .getParkingLotList(180, 182, 1.6, data))
                        .reversed
                        .toList(),
                  ),
                  SizedBox(
                    height: 5 * Environment.maxMeasurement,
                  ),
                  Row(
                    children: (ParkingListWidget()
                            .getParkingLotList(183, 190, 0, data))
                        .reversed
                        .toList(),
                  )
                ],
              ));
  }
}
