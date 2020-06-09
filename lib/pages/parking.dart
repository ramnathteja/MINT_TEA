import 'package:flutter/material.dart';
import 'package:mint_tea/size_config.dart';
import 'package:mint_tea/pages/parkinglotA.dart';
import 'package:mint_tea/pages/parkinglotB.dart';
import 'package:mint_tea/pages/parkinglotC.dart';
import 'package:mint_tea/pages/parkinglotD.dart';
import 'package:mint_tea/pages/parkinglotE.dart';
import 'package:mint_tea/pages/parkinglotF.dart';
import 'package:mint_tea/pages/parkinglotG.dart';
import 'package:mint_tea/pages/parkinglotH.dart';
import 'package:mint_tea/pages/workBuilding.dart';


class Parking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Korea Electronic Technology Institute'),
        centerTitle: true,
      ),
      backgroundColor: Colors.indigo,
      body: Column(          
        crossAxisAlignment: CrossAxisAlignment.start,         
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ParkingLotH(),
              ParkingLotG(),
            ],
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical*1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ParkingLotA(),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal*2,
                  ),
                  ParkingLotB(),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal*2,
                  ),
                  ParkingLotC(),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal*2,
                  ),
                  ParkingLotD(),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal*2,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WorkBuilding(),
                      ParkingLotF(),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical*4,
                  ),
                  ParkingLotE(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
