import 'dart:convert';
import 'package:http/http.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';

class ParkingLotGroupData {
  List<ParkingSpotModel> groupData = new List<ParkingSpotModel>();

  Future<List<ParkingSpotModel>> getGroupData(String url) async {
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
        groupData.add(ParkingSpotModel(
            id: id, resourceName: resourceName, status: status));
      });
      print('length of groupData ${groupData.length}');
      return groupData;
    } catch (e) {
      print('caught exception $e');
      print('set current state to previous known state');
      return groupData;
    }
  }
}
