import 'package:flutter/material.dart';
import 'package:mint_tea/pages/parkingIcon.dart';

class ParkingListWidget {
  List<Widget> getParkingLotList(
      int startID, int endID, double angle, Map groupData) {
    List<Widget> widgetList = new List<Widget>();
    try {
      groupData.forEach((key, value) {
        if (key >= startID && key <= endID) {
          widgetList.add(new ParkingIconCustom(
              requiredAngle: angle, id: key, status: value));
        }
      });
      return widgetList;
    } catch (e) {
      print(e);
      return widgetList;
    }
  }
}
