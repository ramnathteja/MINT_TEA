import 'package:flutter/material.dart';
import 'package:mint_tea/environment.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:provider/provider.dart';

class ParkingLotI extends StatefulWidget {
  @override
  _ParkingLotIState createState() => _ParkingLotIState();
}

class _ParkingLotIState extends State<ParkingLotI> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceI;
    return Container(
      child: (data == null)
          ? Loading()
          : Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 3 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(83, 88, 1.6, data),
                    ),
                    SizedBox(
                      height: 3 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(89, 90, 1.6, data),
                    ),
                    SizedBox(
                      height: Environment.minMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(91, 92, 1.6, data),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(66, 68, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(60, 65, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(58, 59, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(56, 57, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                        children: (ParkingListWidget()
                            .getParkingLotList(43, 45, 1.6, data))),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                        children: (ParkingListWidget()
                            .getParkingLotList(46, 51, 1.6, data))),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                        children: (ParkingListWidget()
                            .getParkingLotList(52, 53, 1.6, data))),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                      children: (ParkingListWidget()
                          .getParkingLotList(54, 55, 1.6, data)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(11, 13, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(5, 10, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(3, 4, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                    SizedBox(
                      height: 2 * Environment.minMeasurement,
                    ),
                    Column(
                      children: (ParkingListWidget()
                              .getParkingLotList(1, 2, 1.6, data))
                          .reversed
                          .toList(),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
