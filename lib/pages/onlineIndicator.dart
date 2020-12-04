import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mint_tea/services/mqttClientWrapper.dart';

class OnlineIndicator extends StatefulWidget {
  @override
  _OnlineIndicatorState createState() => _OnlineIndicatorState();
}

class _OnlineIndicatorState extends State<OnlineIndicator> {
  @override
  Widget build(BuildContext context) {
    final notificationHandler = context.watch<MQTTClientWrapper>();
    MqttCurrentConnectionState data = notificationHandler.connectionState;
    print('this is the data after context.select $data');
    return Container(
      child: Row(
        children: [
          Text('Mqtt Connection State '),
          Icon(
            Icons.wifi,
            color: (data == MqttCurrentConnectionState.CONNECTED)
                ? Colors.green
                : Colors.red,
          )
        ],
      ),
    );
  }
}
