import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matratich_app/user/views/LoginView.dart';
import 'package:matratich_app/user/views/SubscriptionView.dart';
import 'dart:convert' as convert;

import 'package:matratich_app/views/SubscribeView.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
    title: 'Matratich',
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      routes: {
        '/login': (context) => LoginView(),
        '/subscribe':(context) => SubscriptionView()
      },
      home: LoginView(),
    );
  }
}