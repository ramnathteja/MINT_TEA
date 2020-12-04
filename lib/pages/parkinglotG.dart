import 'package:flutter/material.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:mint_tea/services/parkingListWidget.dart';
import 'package:provider/provider.dart';

class ParkingLotG extends StatefulWidget {
  @override
  _ParkingLotGState createState() => _ParkingLotGState();
}

class _ParkingLotGState extends State<ParkingLotG> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    Map data = notificationHandler.spaceG;
    return Container(
        child: (data == null)
            ? Loading()
            : Row(
                children:
                    (ParkingListWidget().getParkingLotList(93, 112, 0, data))
                        .reversed
                        .toList(),
              ));
  }
}
