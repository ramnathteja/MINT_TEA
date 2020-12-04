import 'package:flutter/material.dart';
import 'package:mint_tea/environment.dart';

class ParkingIconCustom extends StatelessWidget {
  final String status;
  final double requiredAngle;
  final int id;
  ParkingIconCustom({this.requiredAngle, this.id, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Environment.maxMeasurement,
      height: Environment.maxMeasurement,
      child: (status != 'free')
          ? Transform.rotate(
              angle: requiredAngle,
              child: Tooltip(
                padding: EdgeInsets.all(10.0),
                message: 'spot:' + id.toString() + '\nstatus: ' + status,
                decoration: new BoxDecoration(
                  color: Colors.purple,
                  gradient: new LinearGradient(
                    colors: [Colors.red, Colors.cyan],
                  ),
                ),
                child: ImageIcon(
                  AssetImage('assets/my_car.jpg'),
                ),
              ),
            )
          : Transform.rotate(
              angle: requiredAngle,
              child: Tooltip(
                padding: EdgeInsets.all(10.0),
                message: 'spot:' + id.toString() + '\nstatus: ' + status,
                child: ImageIcon(
                  AssetImage('assets/my_car.jpg'),
                  color: Colors.red,
                ),
              ),
            ),
    );
    //todo: have to use snackbar to display when clicked on
  }
}
