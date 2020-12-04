import 'package:flutter/material.dart';
import 'package:mint_tea/pages/onlineIndicator.dart';
import 'package:mint_tea/pages/parkinglotA.dart';
import 'package:mint_tea/pages/parkinglotB.dart';
import 'package:mint_tea/pages/parkinglotC.dart';
import 'package:mint_tea/pages/parkinglotD.dart';
import 'package:mint_tea/pages/parkinglotE.dart';
import 'package:mint_tea/pages/parkinglotF.dart';
import 'package:mint_tea/pages/parkinglotG.dart';
import 'package:mint_tea/pages/parkinglotH.dart';
import 'package:mint_tea/pages/parkinglotI.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';
import 'package:provider/provider.dart';

class ParkingBlock extends StatefulWidget {
  @override
  _ParkingBlockState createState() => _ParkingBlockState();
}

class _ParkingBlockState extends State<ParkingBlock> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MQTTClientWrapper(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Korea Electronic Technology Institute'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ParkingLotF(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ParkingLotA(),
                            ParkingLotB(),
                            ParkingLotC(),
                            ParkingLotD(),
                          ],
                        ),
                        ParkingLotE()
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ParkingLotG(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [ParkingLotH(), ParkingLotI()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
