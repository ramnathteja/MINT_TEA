import 'package:flutter/material.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:provider/provider.dart';

import '../environment.dart';

class ParkingLotH extends StatefulWidget {
  @override
  _ParkingLotHState createState() => _ParkingLotHState();
}

class _ParkingLotHState extends State<ParkingLotH> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceH;
    return Container(
      child: (data == null)
          ? Loading()
          : Row(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 2 * Environment.maxMeasurement,
                        ),
                      ],
                    ),
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(69, 82, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 2 * Environment.maxMeasurement,
                        ),
                      ],
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(29, 42, 1.6, data),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(20, 28, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                    SizedBox(
                      height: Environment.maxMeasurement,
                    ),
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(14, 19, 1.6, data))
                          .reversed
                          .toList(),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
