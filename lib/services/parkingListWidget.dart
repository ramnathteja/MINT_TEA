import 'package:flutter/material.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mint_tea/pages/parkingIcon.dart';

class ParkingListWidget {
  List<Widget> getParkingLotList(
      int startID, int endID, List<ParkingSpotModel> groupData) {
    // print(groupData);
    List<Widget> widgetList = new List<Widget>();
    // print('this is the list widget');
    try {
      groupData.forEach((element) {
        // print(element.id);
        if (element.id >= startID && element.id <= endID) {
          // print('added a widget');
          widgetList.add(new ParkingIconCustom(status: element.status));
        }
      });
      return widgetList;
    } catch (e) {
      print(e);
      return widgetList;
    }
  }
}
