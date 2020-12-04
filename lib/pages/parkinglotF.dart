import 'package:flutter/material.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:provider/provider.dart';

import '../environment.dart';

class ParkingLotF extends StatefulWidget {
  @override
  _ParkingLotFState createState() => _ParkingLotFState();
}

class _ParkingLotFState extends State<ParkingLotF> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceF;
    return Container(
      child: (data == null)
          ? Loading()
          : Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 7 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(125, 125, 1.5, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 6.5 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(124, 124, 1.4, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 6 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(123, 123, 1.3, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 5.5 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(122, 122, 1.2, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 5 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(121, 121, 1.1, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 4.5 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(120, 120, 1.0, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 4 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(119, 119, 0.9, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 3.5 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(118, 118, 0.9, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 3 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(117, 117, 0.9, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 2.5 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(116, 116, 1.2, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 2 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(115, 115, 1.4, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 1.5 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(114, 114, 1.5, data),
                    ),
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(113, 113, 1.6, data),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
