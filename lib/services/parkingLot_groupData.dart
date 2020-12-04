import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart';

class ParkingLotGroupData {
  // List<ParkingSpotModel> groupData = new List<ParkingSpotModel>();
  var makeThisDataAMap = new Map();

  Future<Map> getGroupData(String url) async {
    try {
      Map<String, String> requestHeaders = {
        'X-M2M-Origin': 'S20170717074825768bp2l',
        'X-M2M-RI': '1234er5',
        'Accept': 'application/json'
      };
      Response response = await get(url, headers: requestHeaders);
      Map data = jsonDecode(response.body);
      List array = data['m2m:agr']['m2m:rsp'];
      array.forEach((item) {
        String resourceName = item['pc']['sc:parkingSpot']['rn'];
        int id = int.parse(resourceName.substring('parkingSpot_'.length));
        String status = item['pc']['sc:parkingSpot']['status'];
        makeThisDataAMap[id] = status;
      });
      // print(makeThisDataAMap);
      return makeThisDataAMap;
    } catch (e) {
      developer.log('caught exception $e',
          name: "parkingLot_groupData", time: DateTime.now());
      print('set current state to previous known state');
      return makeThisDataAMap;
    }
  }
}
