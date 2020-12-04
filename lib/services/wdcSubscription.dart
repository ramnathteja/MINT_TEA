import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart';

class WDCSubscription {
  List<String> subscribedResources = new List<String>();

  Future<List<String>> getGroupData(String url) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json; ty=23',
        'X-M2M-Origin': 'S20170717074825768bp2l',
        'X-M2M-RI': '1234er5',
        'Accept': 'application/json'
      };
      String bodyContent = jsonEncode({
        'm2m:sub': {
          'rn': url.substring(
              url.lastIndexOf("/", url.lastIndexOf("/") - 1) + 1,
              url.lastIndexOf(
                  "/")), //todo: change the lastIndex to 2nd last index
          'enc': {
            'net': [1, 3],
            'chty': [4]
          },
          'nu': ["mqtt://203.253.128.179:1883/ram?ct=json"],
          'nct': 1
        }
      });
      Response response =
          await post(url, headers: requestHeaders, body: bodyContent);
      Map data = jsonDecode(response.body);
      List array = data['m2m:agr']['m2m:rsp'];
      array.forEach((item) {
        String resourceName = item['fr'];

        subscribedResources.add(resourceName);
      });
      print('length of groupData ${subscribedResources.length}');
      return subscribedResources;
    } catch (e) {
      developer.log('caught exception $e',
          name: "parkingLot_groupData", time: DateTime.now());
      print('set current state to previous known state');
      return subscribedResources;
    }
  }
}
