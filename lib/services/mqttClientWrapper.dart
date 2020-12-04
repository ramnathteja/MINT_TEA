import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mint_tea/environment.dart';
import 'package:mint_tea/services/parkingLot_groupData.dart';
import 'package:mint_tea/models/parkingSpotModel.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:convert';

enum MqttCurrentConnectionState {
  IDLE,
  CONNECTING,
  CONNECTED,
  DISCONNECTED,
  ERROR_WHEN_CONNECTING
}
enum MqttSubscriptionState { IDLE, SUBSCRIBED }

class MQTTClientWrapper extends ChangeNotifier {
  MqttClient client;
  MqttCurrentConnectionState connectionState = MqttCurrentConnectionState.IDLE;
  MqttSubscriptionState subscriptionState = MqttSubscriptionState.IDLE;
  Map spaceA, spaceB, spaceC, spaceD, spaceE, spaceF, spaceG, spaceH, spaceI;

  MQTTClientWrapper() {
    _setupMqttClient();
    _connectClient();
    _initialGroupCall();
  }

  void _setupMqttClient() {
    client = MqttServerClient.withPort(
        '203.253.128.179', 'a8061d6395d3433db1c44e13ea000056', 1883);
    client.logging(on: false);
    client.keepAlivePeriod = 30;
    client.onDisconnected = _onDisconnected;
    client.onConnected = _onConnected;
    client.onSubscribed = _onSubscribed;
  }

  Future<void> _connectClient() async {
    try {
      print('MQTTClientWrapper::Mosquitto client connecting....');
      connectionState = MqttCurrentConnectionState.CONNECTING;
      await client.connect();
    } on Exception catch (e) {
      print('MQTTClientWrapper::client exception - $e');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      connectionState = MqttCurrentConnectionState.CONNECTED;
      print('MQTTClientWrapper::Mosquitto client connected');
      _subscribeToTopic('/oneM2M/req/+/ram/#');
    } else {
      print(
          'MQTTClientWrapper::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }
  }

  void _onDisconnected() {
    print(
        'MQTTClientWrapper::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus.returnCode ==
        MqttConnectReturnCode.brokerUnavailable) {
      print(
          'MQTTClientWrapper::OnDisconnected callback is solicited, this is correct');
    }
    connectionState = MqttCurrentConnectionState.DISCONNECTED;
    notifyListeners();
  }

  void _onConnected() {
    connectionState = MqttCurrentConnectionState.CONNECTED;
    print(
        'MQTTClientWrapper::OnConnected client callback - Client connection was sucessful');
  }

  void _onSubscribed(String topic) {
    print('MQTTClientWrapper::Subscription confirmed for topic $topic');
    subscriptionState = MqttSubscriptionState.SUBSCRIBED;
  }

  void prepareMqttClient() async {
    // _setupMqttClient();
    // await _connectClient();
    // _subscribeToTopic('/oneM2M/req/+/ram/#');
  }

  void _subscribeToTopic(String topicName) {
    print('MQTTClientWrapper::Subscribing to the $topicName topic');
    client.subscribe(topicName, MqttQos.atMostOnce);
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) async {
      final MqttPublishMessage recMess = c[0].payload;
      final String newLocationJson =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      Map data = jsonDecode(newLocationJson);
      String resourceName =
          data['pc']['m2m:sgn']['nev']['rep']['sc:parkingSpot']['rn'];
      int id = int.parse(resourceName.substring('parkingSpot_'.length));
      String status =
          data['pc']['m2m:sgn']['nev']['rep']['sc:parkingSpot']['status'];
      ParkingSpotModel spot = new ParkingSpotModel();
      spot.resourceName = resourceName;
      spot.id = id;
      spot.status = status;
      updateSpace(spot);
    });
  }

  void updateSpace(ParkingSpotModel spot) {
    print(spot.id);
    if ((spot.id) >= 212 && (spot.id) <= 231) {
      spaceA[spot.id] = spot.status;
    } else if ((spot.id) >= 191 && (spot.id) <= 211) {
      spaceB[spot.id] = spot.status;
    } else if ((spot.id) >= 164 && (spot.id) <= 190) {
      spaceC[spot.id] = spot.status;
    } else if ((spot.id) >= 140 && (spot.id) <= 163) {
      spaceD[spot.id] = spot.status;
    } else if ((spot.id) >= 126 && (spot.id) <= 139) {
      spaceE[spot.id] = spot.status;
    } else if ((spot.id) >= 113 && (spot.id) <= 125) {
      spaceF[spot.id] = spot.status;
    } else if ((spot.id) >= 93 && (spot.id) <= 112) {
      spaceG[spot.id] = spot.status;
    } else if ((spot.id) >= 1 && (spot.id) <= 92) {
      if (spaceH.containsKey(spot.id)) {
        spaceH[spot.id] = spot.status;
      } else if (spaceI.containsKey(spot.id)) {
        spaceI[spot.id] = spot.status;
      }
    }
    //need to write a snackbar here !!!!
    notifyListeners();
  }

  Future<void> _initialGroupCall() async {
    ParkingLotGroupData parkingLotGroupData = new ParkingLotGroupData();
    spaceA = await parkingLotGroupData.getGroupData(Environment.lotA_URL);
    spaceB = await parkingLotGroupData.getGroupData(Environment.lotB_URL);
    spaceC = await parkingLotGroupData.getGroupData(Environment.lotC_URL);
    spaceD = await parkingLotGroupData.getGroupData(Environment.lotD_URL);
    spaceE = await parkingLotGroupData.getGroupData(Environment.lotE_URL);
    spaceF = await parkingLotGroupData.getGroupData(Environment.lotF_URL);
    spaceG = await parkingLotGroupData.getGroupData(Environment.lotG_URL);
    spaceH = await parkingLotGroupData.getGroupData(Environment.lotH_URL);
    spaceI = await parkingLotGroupData.getGroupData(Environment.lotI_URL);
    notifyListeners();
  }
}
