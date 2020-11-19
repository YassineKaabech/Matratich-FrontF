import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:matratich_app/models/Registration.dart';

class Registration {
  String baseurl ="http://192.168.1.41:4300/";
  Future getRegData() async {
    var url = baseurl+'fetchAll/';
    var searchResponse = await http.get(url);
    if (searchResponse.statusCode == 200) {
      var jsonResp = json.decode(searchResponse.body);
      if (jsonResp != null)
      {
        print(jsonResp.toString());
      return jsonResp;}
      else return [];
    }else return [];
  }


}