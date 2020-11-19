import 'package:flutter/material.dart';
import 'package:matratich_app/user/services/UserServices.dart';
import 'package:matratich_app/user/views/SubscriptionView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget{
  @override
  _LoginViewState createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView>{
  final _formKey = GlobalKey();
  String username='';
  String password='';
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login Page')),
        body: Container(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'username or email'),
                            onSaved: (val) =>{

                            },
                            controller: usernameController,

                          ),
                          TextFormField(
                              decoration:
                              InputDecoration(labelText: 'password'),
                            obscureText: true,
                            controller: passwordController,

    ),
                          RaisedButton(
                            child: Text('Validate'),
                            color: Color(0xffEE7B23),
                            onPressed: (){
                              // Call to the login service
                              UserServices.loginService(usernameController.text, passwordController.text).then((value)  async {
                                  final prefs =  await SharedPreferences.getInstance();
                                  final token = prefs.getString("token");
                                  final user = prefs.getString("currentUser");
                                  print(token);
                                  print(user);
                              });
                            },
                          ),
                          RaisedButton(
                            child: Text('Nous réjoindre'),
                            color: Color(0xffEE7B23),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => SubscriptionView()
                              ));
                            },
                          )

                        ]
    ),
    ),
    ),
    ),
        );
  }
  
}