import 'package:flutter/material.dart';
import 'package:mint_tea/pages/parkingBlock.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ParkingBlock(),
      },
    ));
