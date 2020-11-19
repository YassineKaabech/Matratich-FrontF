import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matratich_app/user/services/UserServices.dart';
import 'package:matratich_app/user/views/LoginView.dart';

class SubscriptionView extends StatefulWidget {
  @override
  _SubscriptionViewState createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  final _formKey = GlobalKey();
  String username='';
  String password='';
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final cinController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
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
      appBar: AppBar(title: Text('Subscription Page')),
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
                    InputDecoration(labelText: 'Nom'),
                    onSaved: (val) =>{

                    },
                    controller: nameController,

                  ),
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: 'Prénom'),
                    onSaved: (val) =>{

                    },
                    controller: lastnameController,

                  ),
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: 'CIN'),
                    onSaved: (val) =>{

                    },
                    controller: cinController,

                  ),
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: 'Numéro du téléphone'),
                    onSaved: (val) =>{

                    },
                    controller: phoneController,

                  ),
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: 'Email'),
                    onSaved: (val) =>{

                    },
                    controller: emailController,

                  ),
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: 'username'),
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
                    child: Text('Valider'),
                    color: Color(0xffEE7B23),
                    onPressed: (){
                      UserServices.subscriptionService(nameController.text, lastnameController.text, cinController.text, phoneController.text, emailController.text, usernameController.text, passwordController.text);
                    },
                  ),
                  RaisedButton(
                    child: Text('authentification'),
                    color: Color(0xffEE7B23),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LoginView()
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
