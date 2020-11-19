import 'package:flutter/material.dart';
import 'package:matratich_app/models/Registration.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


import 'package:matratich_app/services/RegistrationController.dart';
class SubscribeView extends StatefulWidget{
  @override
  _SubscribeViewState createState() => _SubscribeViewState();
}

class _SubscribeViewState extends State<SubscribeView> {
  var RegList = [];
  @override
  void initState() {
    super.initState();

    _fetchRegById();
  }

  _fetchRegById() async {
    print("_fetchRegid");
    var regById = await Registration().getRegData();
    print(regById.toString());
    if (regById.length > 0) {
      setState(() {
       RegList = regById;
      });
      print(regById.toString());
    } else {
      setState(() {
        RegList = [];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subscription page')),
      floatingActionButton:  FloatingActionButton(
        onPressed:()  {


          },
        child: Icon(Icons.add),

      ),
      body: Container(
        child: Text(RegList.map((item) => item[0].toString()).toList().toString()),
      ),
    );
  }
}