import 'package:flutter/material.dart';
import 'package:mint_tea/environment.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:provider/provider.dart';
import 'package:mint_tea/services/parkingListWidget.dart';

class ParkingLotA extends StatefulWidget {
  @override
  _ParkingLotAState createState() => _ParkingLotAState();
}

class _ParkingLotAState extends State<ParkingLotA> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceA;
    // print('this is the data after context.select $data');
    return Container(
      // color: Colors.blue,
      child: (data == null)
          ? Loading()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(220, 227, 1.6, data),
                    ),
                    SizedBox(
                      height: Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(230, 231, 1.6, data),
                    )
                  ],
                ),
                SizedBox(
                  width: Environment.minMeasurement,
                ),
                Column(
                  children: [
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(212, 219, 1.6, data),
                    ),
                    SizedBox(
                      height: 2 * Environment.maxMeasurement,
                    ),
                    Column(
                      children: ParkingListWidget()
                          .getParkingLotList(228, 229, 1.6, data),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
