import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class UserServices{

  static final String endpoint = "http://192.168.1.41:4300/";

  static Future loginService (String username,String password) async{
    Map data = {
      'label': "$username",
      'password':"$password"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(endpoint+"login",
        headers: {"Content-Type": "application/json"},
        body: body
    );
  //  print("${response.statusCode}");
   // print("${response.body}");
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> user = jsonDecode(response.body.toString());
    prefs.setString("token", user['token']);
    prefs.setString("currentUser", json.encode(user['user']));
    return response;
  }


  static Future subscriptionService (String nom,String prenom,String cin,String phone,String email,String username,String password ) async{
    Map data = {
      'name': "$nom",
      'lastName':"$prenom",
      'cin': int.parse(cin),
      'phone':int.parse(phone),
      'username': "$username",
      'email':"$email",
      'password':"$password",
      'role': "professional"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(endpoint+"register",
        headers: {"Content-Type": "application/json"},
        body: body
    );
    /*
    *     final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> user = jsonDecode(response.body.toString());
    prefs.setString("token", user['token']);
    prefs.setString("currentUser", json.encode(user['user']));*/
    return response;
  }


}