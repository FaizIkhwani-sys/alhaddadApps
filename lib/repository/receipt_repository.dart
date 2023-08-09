import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';
    class ReceiptRepository extends BaseRepository{

  Future<List<Premis>?> getPremis(String premisId) async {
    SharedPreferences _prefsPOS = await SharedPreferences.getInstance();
    String? bearerTokenPOS = _prefsPOS.getString('BTPOS');
    String? idOrder = _prefsPOS.getString('idOrder');

    final response = await APIHelper().getRequest(
      hostUrl: baseApiUrl,
      path: 'dynamic/getPremis?'
        'pos=1&bearer=$bearerTokenPOS&id=$premisId',
      // queryParameters: {
      //   "pos": "1",
      //   "bearer": "$token",
      //   "id":"$premisId"
      // }
    );

    if (response == null) return null;
    List list = response["getPremis"];
    List<Premis> premisList = list.map((e) => Premis.fromJson(e)).toList();

    print("Premis by id from orders: $premisList");


    return premisList;
  }

  Future<List<Orders1>?> getOrders() async {
    SharedPreferences _prefsPOS = await SharedPreferences.getInstance();
    String? bearerTokenPOS = _prefsPOS.getString('BTPOS');
    String? idOrder = _prefsPOS.getString('idOrder');

    final response = await APIHelper().getRequest(
      hostUrl: baseApiUrl,
      path: 'dynamic/getOrders?'
        'pos=1&bearer=$bearerTokenPOS&order_id=$idOrder&status=509',
      // queryParameters: {
      //   "pos": "1",
      //   "bearer": "$token",
      //   "order_id": "90",
      //   "status": "509"
      // }
    );

    if (response == null) return null;
    List list = response["getOrders"];
    List<Orders1> ordersList = list.map((e) => Orders1.fromJson(e)).toList();

    print("order509: ${ordersList[0].premisId}");

    return ordersList;
  }

  Future<List<OrderDetailsAll>?> getOrderDetails() async {
    SharedPreferences _prefsPOS = await SharedPreferences.getInstance();
    String? bearerTokenPOS = _prefsPOS.getString('BTPOS');
    String? idOrder = _prefsPOS.getString('idOrder');

    final response = await APIHelper().getRequest(
      hostUrl: baseApiUrl,
      path: 'dynamic/getOrderDetails?'
          'pos=1&bearer=$bearerTokenPOS&orderId=$idOrder',
      // queryParameters: {
      //   "pos": "1",
      //   "bearer": "$token",
      //   "order_id": "90",
      // }
    );

    if (response == null) return null;
    List list = response["getOrderDetails"];
    List<OrderDetailsAll> ordersDetailsList = list.map((e) => OrderDetailsAll.fromJson(e)).toList();

    print("orders DetailsList: $ordersDetailsList");

    return ordersDetailsList;
  }

  Future<List<Premis>?> getPremisOffline(String premisId) async {
    SharedPreferences _prefsPOS = await SharedPreferences.getInstance();
    String? bearerTokenPOS = _prefsPOS.getString('BTPOS');
    String? idOrder = _prefsPOS.getString('idOrder');
    String? ipServer = _prefsPOS.getString('IPServerOffline');

    final response = await APIHelper().getRequest(
      hostUrl: "http://$ipServer/api",
      path: 'dynamic/getPremis?'
        'pos=1&bearer=$bearerTokenPOS&id=$premisId',
      // queryParameters: {
      //   "pos": "1",
      //   "bearer": "$token",
      //   "id":"$premisId"
      // }
    );

    if (response == null) return null;
    List list = response["getPremis"];
    List<Premis> premisList = list.map((e) => Premis.fromJson(e)).toList();

    print("Premis by id from orders: $premisList");


    return premisList;
  }

  Future<List<Orders1>?> getOrdersOffline() async {
    SharedPreferences _prefsPOS = await SharedPreferences.getInstance();
    String? bearerTokenPOS = _prefsPOS.getString('BTPOS');
    String? idOrder = _prefsPOS.getString('idOrder');
    String? ipServer = _prefsPOS.getString('IPServerOffline');

    final response = await APIHelper().getRequest(
      hostUrl: "http://$ipServer/api/",
      path: 'dynamic/getOrders?'
        'pos=1&bearer=$bearerTokenPOS&order_id=$idOrder&status=509',
      // queryParameters: {
      //   "pos": "1",
      //   "bearer": "$token",
      //   "order_id": "90",
      //   "status": "509"
      // }
    );

    if (response == null) return null;
    List list = response["getOrders"];
    List<Orders1> ordersList = list.map((e) => Orders1.fromJson(e)).toList();

    print("order509: ${ordersList[0].premisId}");

    return ordersList;
  }

  Future<List<OrderDetailsAll>?> getOrderDetailsOffline() async {
    SharedPreferences _prefsPOS = await SharedPreferences.getInstance();
    String? bearerTokenPOS = _prefsPOS.getString('BTPOS');
    String? idOrder = _prefsPOS.getString('idOrder');
    String? ipServer = _prefsPOS.getString('IPServerOffline');

    final response = await APIHelper().getRequest(
      hostUrl: "http://$ipServer/api",
      path: 'dynamic/getOrderDetails?'
          'pos=1&bearer=$bearerTokenPOS&orderId=$idOrder',
      // queryParameters: {
      //   "pos": "1",
      //   "bearer": "$token",
      //   "order_id": "90",
      // }
    );

    if (response == null) return null;
    List list = response["getOrderDetails"];
    List<OrderDetailsAll> ordersDetailsList = list.map((e) => OrderDetailsAll.fromJson(e)).toList();

    print("orders DetailsList: $ordersDetailsList");

    return ordersDetailsList;
  }
}