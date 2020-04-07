import 'package:flutter/material.dart';
import 'package:mint_tea/pages/choose_location.dart';
import 'package:mint_tea/pages/home.dart';
import 'package:mint_tea/pages/loading.dart';
import 'package:mint_tea/pages/parking.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/loading': (context) => Loading(),
    '/': (context) => Parking(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
)); 