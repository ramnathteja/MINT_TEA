import 'package:http/http.dart';


class ParkingLotGroupData {

  Future<void> getGroupData() async {
    try {
      await get('url');

    } catch (e) {
      print('caught exception $e');
      String data = 'set current state to previous known state';
      print(data);
    }
  }

}